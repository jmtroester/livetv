// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'levels_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LevelsRecord> _$levelsRecordSerializer =
    new _$LevelsRecordSerializer();

class _$LevelsRecordSerializer implements StructuredSerializer<LevelsRecord> {
  @override
  final Iterable<Type> types = const [LevelsRecord, _$LevelsRecord];
  @override
  final String wireName = 'LevelsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, LevelsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.levelId;
    if (value != null) {
      result
        ..add('level_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.levelImage;
    if (value != null) {
      result
        ..add('level_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.minPoints;
    if (value != null) {
      result
        ..add('min_points')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.maxPoints;
    if (value != null) {
      result
        ..add('max_points')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  LevelsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LevelsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'level_id':
          result.levelId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'level_image':
          result.levelImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'min_points':
          result.minPoints = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'max_points':
          result.maxPoints = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$LevelsRecord extends LevelsRecord {
  @override
  final int levelId;
  @override
  final String levelImage;
  @override
  final int minPoints;
  @override
  final int maxPoints;
  @override
  final BuiltList<DocumentReference<Object>> user;
  @override
  final DocumentReference<Object> reference;

  factory _$LevelsRecord([void Function(LevelsRecordBuilder) updates]) =>
      (new LevelsRecordBuilder()..update(updates)).build();

  _$LevelsRecord._(
      {this.levelId,
      this.levelImage,
      this.minPoints,
      this.maxPoints,
      this.user,
      this.reference})
      : super._();

  @override
  LevelsRecord rebuild(void Function(LevelsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LevelsRecordBuilder toBuilder() => new LevelsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LevelsRecord &&
        levelId == other.levelId &&
        levelImage == other.levelImage &&
        minPoints == other.minPoints &&
        maxPoints == other.maxPoints &&
        user == other.user &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, levelId.hashCode), levelImage.hashCode),
                    minPoints.hashCode),
                maxPoints.hashCode),
            user.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LevelsRecord')
          ..add('levelId', levelId)
          ..add('levelImage', levelImage)
          ..add('minPoints', minPoints)
          ..add('maxPoints', maxPoints)
          ..add('user', user)
          ..add('reference', reference))
        .toString();
  }
}

class LevelsRecordBuilder
    implements Builder<LevelsRecord, LevelsRecordBuilder> {
  _$LevelsRecord _$v;

  int _levelId;
  int get levelId => _$this._levelId;
  set levelId(int levelId) => _$this._levelId = levelId;

  String _levelImage;
  String get levelImage => _$this._levelImage;
  set levelImage(String levelImage) => _$this._levelImage = levelImage;

  int _minPoints;
  int get minPoints => _$this._minPoints;
  set minPoints(int minPoints) => _$this._minPoints = minPoints;

  int _maxPoints;
  int get maxPoints => _$this._maxPoints;
  set maxPoints(int maxPoints) => _$this._maxPoints = maxPoints;

  ListBuilder<DocumentReference<Object>> _user;
  ListBuilder<DocumentReference<Object>> get user =>
      _$this._user ??= new ListBuilder<DocumentReference<Object>>();
  set user(ListBuilder<DocumentReference<Object>> user) => _$this._user = user;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  LevelsRecordBuilder() {
    LevelsRecord._initializeBuilder(this);
  }

  LevelsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _levelId = $v.levelId;
      _levelImage = $v.levelImage;
      _minPoints = $v.minPoints;
      _maxPoints = $v.maxPoints;
      _user = $v.user?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LevelsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LevelsRecord;
  }

  @override
  void update(void Function(LevelsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LevelsRecord build() {
    _$LevelsRecord _$result;
    try {
      _$result = _$v ??
          new _$LevelsRecord._(
              levelId: levelId,
              levelImage: levelImage,
              minPoints: minPoints,
              maxPoints: maxPoints,
              user: _user?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LevelsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
