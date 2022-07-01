// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'non_sermon_podcast_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NonSermonPodcastRecord> _$nonSermonPodcastRecordSerializer =
    new _$NonSermonPodcastRecordSerializer();

class _$NonSermonPodcastRecordSerializer
    implements StructuredSerializer<NonSermonPodcastRecord> {
  @override
  final Iterable<Type> types = const [
    NonSermonPodcastRecord,
    _$NonSermonPodcastRecord
  ];
  @override
  final String wireName = 'NonSermonPodcastRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, NonSermonPodcastRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.podcastId;
    if (value != null) {
      result
        ..add('podcast_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.podcastName;
    if (value != null) {
      result
        ..add('podcast_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.podcastLink;
    if (value != null) {
      result
        ..add('podcast_link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.meta;
    if (value != null) {
      result
        ..add('meta')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.podcastUrl;
    if (value != null) {
      result
        ..add('podcast_url')
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
  NonSermonPodcastRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NonSermonPodcastRecordBuilder();

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
        case 'podcast_name':
          result.podcastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'podcast_link':
          result.podcastLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'meta':
          result.meta = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'podcast_url':
          result.podcastUrl = serializers.deserialize(value,
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

class _$NonSermonPodcastRecord extends NonSermonPodcastRecord {
  @override
  final int podcastId;
  @override
  final String podcastName;
  @override
  final String podcastLink;
  @override
  final String meta;
  @override
  final String podcastUrl;
  @override
  final DocumentReference<Object> reference;

  factory _$NonSermonPodcastRecord(
          [void Function(NonSermonPodcastRecordBuilder) updates]) =>
      (new NonSermonPodcastRecordBuilder()..update(updates)).build();

  _$NonSermonPodcastRecord._(
      {this.podcastId,
      this.podcastName,
      this.podcastLink,
      this.meta,
      this.podcastUrl,
      this.reference})
      : super._();

  @override
  NonSermonPodcastRecord rebuild(
          void Function(NonSermonPodcastRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NonSermonPodcastRecordBuilder toBuilder() =>
      new NonSermonPodcastRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NonSermonPodcastRecord &&
        podcastId == other.podcastId &&
        podcastName == other.podcastName &&
        podcastLink == other.podcastLink &&
        meta == other.meta &&
        podcastUrl == other.podcastUrl &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, podcastId.hashCode), podcastName.hashCode),
                    podcastLink.hashCode),
                meta.hashCode),
            podcastUrl.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NonSermonPodcastRecord')
          ..add('podcastId', podcastId)
          ..add('podcastName', podcastName)
          ..add('podcastLink', podcastLink)
          ..add('meta', meta)
          ..add('podcastUrl', podcastUrl)
          ..add('reference', reference))
        .toString();
  }
}

class NonSermonPodcastRecordBuilder
    implements Builder<NonSermonPodcastRecord, NonSermonPodcastRecordBuilder> {
  _$NonSermonPodcastRecord _$v;

  int _podcastId;
  int get podcastId => _$this._podcastId;
  set podcastId(int podcastId) => _$this._podcastId = podcastId;

  String _podcastName;
  String get podcastName => _$this._podcastName;
  set podcastName(String podcastName) => _$this._podcastName = podcastName;

  String _podcastLink;
  String get podcastLink => _$this._podcastLink;
  set podcastLink(String podcastLink) => _$this._podcastLink = podcastLink;

  String _meta;
  String get meta => _$this._meta;
  set meta(String meta) => _$this._meta = meta;

  String _podcastUrl;
  String get podcastUrl => _$this._podcastUrl;
  set podcastUrl(String podcastUrl) => _$this._podcastUrl = podcastUrl;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  NonSermonPodcastRecordBuilder() {
    NonSermonPodcastRecord._initializeBuilder(this);
  }

  NonSermonPodcastRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _podcastId = $v.podcastId;
      _podcastName = $v.podcastName;
      _podcastLink = $v.podcastLink;
      _meta = $v.meta;
      _podcastUrl = $v.podcastUrl;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NonSermonPodcastRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NonSermonPodcastRecord;
  }

  @override
  void update(void Function(NonSermonPodcastRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NonSermonPodcastRecord build() {
    final _$result = _$v ??
        new _$NonSermonPodcastRecord._(
            podcastId: podcastId,
            podcastName: podcastName,
            podcastLink: podcastLink,
            meta: meta,
            podcastUrl: podcastUrl,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
