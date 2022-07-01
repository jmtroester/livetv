// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catechisms_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CatechismsRecord> _$catechismsRecordSerializer =
    new _$CatechismsRecordSerializer();

class _$CatechismsRecordSerializer
    implements StructuredSerializer<CatechismsRecord> {
  @override
  final Iterable<Type> types = const [CatechismsRecord, _$CatechismsRecord];
  @override
  final String wireName = 'CatechismsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, CatechismsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.catechismId;
    if (value != null) {
      result
        ..add('catechism_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.question;
    if (value != null) {
      result
        ..add('question')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.answer;
    if (value != null) {
      result
        ..add('answer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.verse1;
    if (value != null) {
      result
        ..add('verse1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.verse2;
    if (value != null) {
      result
        ..add('verse2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.verse3;
    if (value != null) {
      result
        ..add('verse3')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  CatechismsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CatechismsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'catechism_id':
          result.catechismId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'question':
          result.question = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'answer':
          result.answer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'verse1':
          result.verse1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'verse2':
          result.verse2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'verse3':
          result.verse3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$CatechismsRecord extends CatechismsRecord {
  @override
  final int catechismId;
  @override
  final String question;
  @override
  final String answer;
  @override
  final String verse1;
  @override
  final String verse2;
  @override
  final String verse3;
  @override
  final String image;
  @override
  final DocumentReference<Object> reference;

  factory _$CatechismsRecord(
          [void Function(CatechismsRecordBuilder) updates]) =>
      (new CatechismsRecordBuilder()..update(updates)).build();

  _$CatechismsRecord._(
      {this.catechismId,
      this.question,
      this.answer,
      this.verse1,
      this.verse2,
      this.verse3,
      this.image,
      this.reference})
      : super._();

  @override
  CatechismsRecord rebuild(void Function(CatechismsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CatechismsRecordBuilder toBuilder() =>
      new CatechismsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CatechismsRecord &&
        catechismId == other.catechismId &&
        question == other.question &&
        answer == other.answer &&
        verse1 == other.verse1 &&
        verse2 == other.verse2 &&
        verse3 == other.verse3 &&
        image == other.image &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, catechismId.hashCode),
                                question.hashCode),
                            answer.hashCode),
                        verse1.hashCode),
                    verse2.hashCode),
                verse3.hashCode),
            image.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CatechismsRecord')
          ..add('catechismId', catechismId)
          ..add('question', question)
          ..add('answer', answer)
          ..add('verse1', verse1)
          ..add('verse2', verse2)
          ..add('verse3', verse3)
          ..add('image', image)
          ..add('reference', reference))
        .toString();
  }
}

class CatechismsRecordBuilder
    implements Builder<CatechismsRecord, CatechismsRecordBuilder> {
  _$CatechismsRecord _$v;

  int _catechismId;
  int get catechismId => _$this._catechismId;
  set catechismId(int catechismId) => _$this._catechismId = catechismId;

  String _question;
  String get question => _$this._question;
  set question(String question) => _$this._question = question;

  String _answer;
  String get answer => _$this._answer;
  set answer(String answer) => _$this._answer = answer;

  String _verse1;
  String get verse1 => _$this._verse1;
  set verse1(String verse1) => _$this._verse1 = verse1;

  String _verse2;
  String get verse2 => _$this._verse2;
  set verse2(String verse2) => _$this._verse2 = verse2;

  String _verse3;
  String get verse3 => _$this._verse3;
  set verse3(String verse3) => _$this._verse3 = verse3;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  CatechismsRecordBuilder() {
    CatechismsRecord._initializeBuilder(this);
  }

  CatechismsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _catechismId = $v.catechismId;
      _question = $v.question;
      _answer = $v.answer;
      _verse1 = $v.verse1;
      _verse2 = $v.verse2;
      _verse3 = $v.verse3;
      _image = $v.image;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CatechismsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CatechismsRecord;
  }

  @override
  void update(void Function(CatechismsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CatechismsRecord build() {
    final _$result = _$v ??
        new _$CatechismsRecord._(
            catechismId: catechismId,
            question: question,
            answer: answer,
            verse1: verse1,
            verse2: verse2,
            verse3: verse3,
            image: image,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
