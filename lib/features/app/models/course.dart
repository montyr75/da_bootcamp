import 'package:dart_mappable/dart_mappable.dart';

import 'lesson.dart';

part 'course.mapper.dart';

@MappableClass()
class Course with CourseMappable {
  final String name;
  final List<Lesson> lessons;

  const Course({
    required this.name,
    required this.lessons,
  });
}