import 'package:dart_mappable/dart_mappable.dart';

part 'lesson.mapper.dart';

@MappableClass()
class Lesson with LessonMappable {
  final String name;
  final String filename;
  final String? content;

  const Lesson({
    required this.name,
    required this.filename,
    this.content,
  });
}