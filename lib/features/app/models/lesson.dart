import 'package:dart_mappable/dart_mappable.dart';

part 'lesson.mapper.dart';

@MappableClass()
class Lesson with LessonMappable {
  final String name;
  final String path;

  const Lesson({
    required this.name,
    required this.path,
  });
}