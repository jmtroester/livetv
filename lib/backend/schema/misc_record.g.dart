// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'misc_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MiscRecord> _$miscRecordSerializer = new _$MiscRecordSerializer();

class _$MiscRecordSerializer implements StructuredSerializer<MiscRecord> {
  @override
  final Iterable<Type> types = const [MiscRecord, _$MiscRecord];
  @override
  final String wireName = 'MiscRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, MiscRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.homeImage;
    if (value != null) {
      result
        ..add('home_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.homeText;
    if (value != null) {
      result
        ..add('home_text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.homeImageLink;
    if (value != null) {
      result
        ..add('home_image_link')
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
  MiscRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MiscRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'home_image':
          result.homeImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'home_text':
          result.homeText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'home_image_link':
          result.homeImageLink = serializers.deserialize(value,
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

class _$MiscRecord extends MiscRecord {
  @override
  final String homeImage;
  @override
  final String homeText;
  @override
  final String homeImageLink;
  @override
  final DocumentReference<Object> reference;

  factory _$MiscRecord([void Function(MiscRecordBuilder) updates]) =>
      (new MiscRecordBuilder()..update(updates)).build();

  _$MiscRecord._(
      {this.homeImage, this.homeText, this.homeImageLink, this.reference})
      : super._();

  @override
  MiscRecord rebuild(void Function(MiscRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MiscRecordBuilder toBuilder() => new MiscRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MiscRecord &&
        homeImage == other.homeImage &&
        homeText == other.homeText &&
        homeImageLink == other.homeImageLink &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, homeImage.hashCode), homeText.hashCode),
            homeImageLink.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MiscRecord')
          ..add('homeImage', homeImage)
          ..add('homeText', homeText)
          ..add('homeImageLink', homeImageLink)
          ..add('reference', reference))
        .toString();
  }
}

class MiscRecordBuilder implements Builder<MiscRecord, MiscRecordBuilder> {
  _$MiscRecord _$v;

  String _homeImage;
  String get homeImage => _$this._homeImage;
  set homeImage(String homeImage) => _$this._homeImage = homeImage;

  String _homeText;
  String get homeText => _$this._homeText;
  set homeText(String homeText) => _$this._homeText = homeText;

  String _homeImageLink;
  String get homeImageLink => _$this._homeImageLink;
  set homeImageLink(String homeImageLink) =>
      _$this._homeImageLink = homeImageLink;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  MiscRecordBuilder() {
    MiscRecord._initializeBuilder(this);
  }

  MiscRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _homeImage = $v.homeImage;
      _homeText = $v.homeText;
      _homeImageLink = $v.homeImageLink;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MiscRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MiscRecord;
  }

  @override
  void update(void Function(MiscRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MiscRecord build() {
    final _$result = _$v ??
        new _$MiscRecord._(
            homeImage: homeImage,
            homeText: homeText,
            homeImageLink: homeImageLink,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
