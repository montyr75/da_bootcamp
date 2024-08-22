import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app_config.dart';
import '../../models/course.dart';
import '../../models/lesson.dart';
import 'app_state.dart';

part 'app_service.g.dart';

@Riverpod(keepAlive: true)
class AppService extends _$AppService {
  @override
  AppState build() {
    _loadCourses();
    return const AppState();
  }

  Future<void> _loadCourses() async {
    final data = await rootBundle.loadString('assets/data/courses/courses.json');
    final courses = jsonDecode(data) as List;

    state = state.copyWith(
      courses: courses.map((value) => CourseMapper.fromMap(value)).toList(),
    );
  }

  Future<void> selectCourse(Course value) async {
    final data = await rootBundle.loadString('assets/data/courses/${value.path}/lessons.json');
    final lessonList = jsonDecode(data) as List;
    final lessons = lessonList.map((value) => LessonMapper.fromMap(value)).toList();

    state = state.copyWith(
      course: value.copyWith(lessons: lessons),
    );

    log.info(state.course);
  }

  Future<void> selectLesson(Lesson value) async {
    final data = await rootBundle.loadString('assets/data/courses/${state.course?.path}/${value.filename}');

    state = state.copyWith(
      lesson: value.copyWith(
        content: data,
      ),
    );
  }
}
