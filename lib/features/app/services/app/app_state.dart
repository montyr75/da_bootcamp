
import '../../models/course.dart';
import '../../models/lesson.dart';

class AppState {
  final List<Course>? courses;
  final Course? course;
  final Lesson? lesson;

  const AppState({
    this.courses,
    this.course,
    this.lesson,
  });

  AppState copyWith({
    List<Course>? courses,
    Course? course,
    Lesson? lesson,
  }) {
    return AppState(
      courses: courses ?? this.courses,
      course: course ?? this.course,
      lesson: lesson ?? this.lesson,
    );
  }
}
