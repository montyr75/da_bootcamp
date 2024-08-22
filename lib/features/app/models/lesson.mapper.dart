// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'lesson.dart';

class LessonMapper extends ClassMapperBase<Lesson> {
  LessonMapper._();

  static LessonMapper? _instance;
  static LessonMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LessonMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Lesson';

  static String _$name(Lesson v) => v.name;
  static const Field<Lesson, String> _f$name = Field('name', _$name);
  static String _$filename(Lesson v) => v.filename;
  static const Field<Lesson, String> _f$filename =
      Field('filename', _$filename);
  static String? _$content(Lesson v) => v.content;
  static const Field<Lesson, String> _f$content =
      Field('content', _$content, opt: true);

  @override
  final MappableFields<Lesson> fields = const {
    #name: _f$name,
    #filename: _f$filename,
    #content: _f$content,
  };

  static Lesson _instantiate(DecodingData data) {
    return Lesson(
        name: data.dec(_f$name),
        filename: data.dec(_f$filename),
        content: data.dec(_f$content));
  }

  @override
  final Function instantiate = _instantiate;

  static Lesson fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Lesson>(map);
  }

  static Lesson fromJson(String json) {
    return ensureInitialized().decodeJson<Lesson>(json);
  }
}

mixin LessonMappable {
  String toJson() {
    return LessonMapper.ensureInitialized().encodeJson<Lesson>(this as Lesson);
  }

  Map<String, dynamic> toMap() {
    return LessonMapper.ensureInitialized().encodeMap<Lesson>(this as Lesson);
  }

  LessonCopyWith<Lesson, Lesson, Lesson> get copyWith =>
      _LessonCopyWithImpl(this as Lesson, $identity, $identity);
  @override
  String toString() {
    return LessonMapper.ensureInitialized().stringifyValue(this as Lesson);
  }

  @override
  bool operator ==(Object other) {
    return LessonMapper.ensureInitialized().equalsValue(this as Lesson, other);
  }

  @override
  int get hashCode {
    return LessonMapper.ensureInitialized().hashValue(this as Lesson);
  }
}

extension LessonValueCopy<$R, $Out> on ObjectCopyWith<$R, Lesson, $Out> {
  LessonCopyWith<$R, Lesson, $Out> get $asLesson =>
      $base.as((v, t, t2) => _LessonCopyWithImpl(v, t, t2));
}

abstract class LessonCopyWith<$R, $In extends Lesson, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? filename, String? content});
  LessonCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LessonCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Lesson, $Out>
    implements LessonCopyWith<$R, Lesson, $Out> {
  _LessonCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Lesson> $mapper = LessonMapper.ensureInitialized();
  @override
  $R call({String? name, String? filename, Object? content = $none}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (filename != null) #filename: filename,
        if (content != $none) #content: content
      }));
  @override
  Lesson $make(CopyWithData data) => Lesson(
      name: data.get(#name, or: $value.name),
      filename: data.get(#filename, or: $value.filename),
      content: data.get(#content, or: $value.content));

  @override
  LessonCopyWith<$R2, Lesson, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _LessonCopyWithImpl($value, $cast, t);
}
