// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast_list_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PodcastListRecord> _$podcastListRecordSerializer =
    new _$PodcastListRecordSerializer();

class _$PodcastListRecordSerializer
    implements StructuredSerializer<PodcastListRecord> {
  @override
  final Iterable<Type> types = const [PodcastListRecord, _$PodcastListRecord];
  @override
  final String wireName = 'PodcastListRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PodcastListRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.podcastId;
    if (value != null) {
      result
        ..add('podcast_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.podcastLink;
    if (value != null) {
      result
        ..add('podcast_link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.podcastName;
    if (value != null) {
      result
        ..add('podcast_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.embedCode;
    if (value != null) {
      result
        ..add('embed_code')
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
  PodcastListRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PodcastListRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'podcast_id':
          result.podcastId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'podcast_link':
          result.podcastLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'podcast_name':
          result.podcastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'embed_code':
          result.embedCode = serializers.deserialize(value,
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

class _$PodcastListRecord extends PodcastListRecord {
  @override
  final int podcastId;
  @override
  final String podcastLink;
  @override
  final String podcastName;
  @override
  final String embedCode;
  @override
  final DocumentReference<Object> reference;

  factory _$PodcastListRecord(
          [void Function(PodcastListRecordBuilder) updates]) =>
      (new PodcastListRecordBuilder()..update(updates)).build();

  _$PodcastListRecord._(
      {this.podcastId,
      this.podcastLink,
      this.podcastName,
      this.embedCode,
      this.reference})
      : super._();

  @override
  PodcastListRecord rebuild(void Function(PodcastListRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PodcastListRecordBuilder toBuilder() =>
      new PodcastListRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PodcastListRecord &&
        podcastId == other.podcastId &&
        podcastLink == other.podcastLink &&
        podcastName == other.podcastName &&
        embedCode == other.embedCode &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, podcastId.hashCode), podcastLink.hashCode),
                podcastName.hashCode),
            embedCode.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PodcastListRecord')
          ..add('podcastId', podcastId)
          ..add('podcastLink', podcastLink)
          ..add('podcastName', podcastName)
          ..add('embedCode', embedCode)
          ..add('reference', reference))
        .toString();
  }
}

class PodcastListRecordBuilder
    implements Builder<PodcastListRecord, PodcastListRecordBuilder> {
  _$PodcastListRecord _$v;

  int _podcastId;
  int get podcastId => _$this._podcastId;
  set podcastId(int podcastId) => _$this._podcastId = podcastId;

  String _podcastLink;
  String get podcastLink => _$this._podcastLink;
  set podcastLink(String podcastLink) => _$this._podcastLink = podcastLink;

  String _podcastName;
  String get podcastName => _$this._podcastName;
  set podcastName(String podcastName) => _$this._podcastName = podcastName;

  String _embedCode;
  String get embedCode => _$this._embedCode;
  set embedCode(String embedCode) => _$this._embedCode = embedCode;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PodcastListRecordBuilder() {
    PodcastListRecord._initializeBuilder(this);
  }

  PodcastListRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _podcastId = $v.podcastId;
      _podcastLink = $v.podcastLink;
      _podcastName = $v.podcastName;
      _embedCode = $v.embedCode;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PodcastListRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PodcastListRecord;
  }

  @override
  void update(void Function(PodcastListRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PodcastListRecord build() {
    final _$result = _$v ??
        new _$PodcastListRecord._(
            podcastId: podcastId,
            podcastLink: podcastLink,
            podcastName: podcastName,
            embedCode: embedCode,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
