// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'course.dart';

class CourseMapper extends ClassMapperBase<Course> {
  CourseMapper._();

  static CourseMapper? _instance;
  static CourseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CourseMapper._());
      LessonMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Course';

  static String _$name(Course v) => v.name;
  static const Field<Course, String> _f$name = Field('name', _$name);
  static List<Lesson> _$lessons(Course v) => v.lessons;
  static const Field<Course, List<Lesson>> _f$lessons =
      Field('lessons', _$lessons);

  @override
  final MappableFields<Course> fields = const {
    #name: _f$name,
    #lessons: _f$lessons,
  };

  static Course _instantiate(DecodingData data) {
    return Course(name: data.dec(_f$name), lessons: data.dec(_f$lessons));
  }

  @override
  final Function instantiate = _instantiate;

  static Course fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Course>(map);
  }

  static Course fromJson(String json) {
    return ensureInitialized().decodeJson<Course>(json);
  }
}

mixin CourseMappable {
  String toJson() {
    return CourseMapper.ensureInitialized().encodeJson<Course>(this as Course);
  }

  Map<String, dynamic> toMap() {
    return CourseMapper.ensureInitialized().encodeMap<Course>(this as Course);
  }

  CourseCopyWith<Course, Course, Course> get copyWith =>
      _CourseCopyWithImpl(this as Course, $identity, $identity);
  @override
  String toString() {
    return CourseMapper.ensureInitialized().stringifyValue(this as Course);
  }

  @override
  bool operator ==(Object other) {
    return CourseMapper.ensureInitialized().equalsValue(this as Course, other);
  }

  @override
  int get hashCode {
    return CourseMapper.ensureInitialized().hashValue(this as Course);
  }
}

extension CourseValueCopy<$R, $Out> on ObjectCopyWith<$R, Course, $Out> {
  CourseCopyWith<$R, Course, $Out> get $asCourse =>
      $base.as((v, t, t2) => _CourseCopyWithImpl(v, t, t2));
}

abstract class CourseCopyWith<$R, $In extends Course, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Lesson, LessonCopyWith<$R, Lesson, Lesson>> get lessons;
  $R call({String? name, List<Lesson>? lessons});
  CourseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CourseCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Course, $Out>
    implements CourseCopyWith<$R, Course, $Out> {
  _CourseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Course> $mapper = CourseMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Lesson, LessonCopyWith<$R, Lesson, Lesson>> get lessons =>
      ListCopyWith($value.lessons, (v, t) => v.copyWith.$chain(t),
          (v) => call(lessons: v));
  @override
  $R call({String? name, List<Lesson>? lessons}) => $apply(FieldCopyWithData(
      {if (name != null) #name: name, if (lessons != null) #lessons: lessons}));
  @override
  Course $make(CopyWithData data) => Course(
      name: data.get(#name, or: $value.name),
      lessons: data.get(#lessons, or: $value.lessons));

  @override
  CourseCopyWith<$R2, Course, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CourseCopyWithImpl($value, $cast, t);
}
