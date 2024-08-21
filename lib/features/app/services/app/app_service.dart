import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    String data = await rootBundle.loadString('assets/data/courses/courses.json');
    final courses = jsonDecode(data) as List;

    state = state.copyWith(
      courses: courses.map((value) => CourseMapper.fromMap(value)).toList(),
    );

    print(courses);
  }

  void selectCourse(Course value) {
    state = state.copyWith(
      course: value,
    );
  }

  void selectLesson(Lesson value) {
    state = state.copyWith(
      lesson: value,
    );
  }
}
