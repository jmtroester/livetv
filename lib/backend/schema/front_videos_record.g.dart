// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'front_videos_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FrontVideosRecord> _$frontVideosRecordSerializer =
    new _$FrontVideosRecordSerializer();

class _$FrontVideosRecordSerializer
    implements StructuredSerializer<FrontVideosRecord> {
  @override
  final Iterable<Type> types = const [FrontVideosRecord, _$FrontVideosRecord];
  @override
  final String wireName = 'FrontVideosRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, FrontVideosRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.videoName;
    if (value != null) {
      result
        ..add('video_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.videoId;
    if (value != null) {
      result
        ..add('video_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.videoLink;
    if (value != null) {
      result
        ..add('video_link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.videoThumbnail;
    if (value != null) {
      result
        ..add('video_thumbnail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.videoLength;
    if (value != null) {
      result
        ..add('video_length')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.urlString;
    if (value != null) {
      result
        ..add('url_string')
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
  FrontVideosRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FrontVideosRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'video_name':
          result.videoName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'video_id':
          result.videoId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'video_link':
          result.videoLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'video_thumbnail':
          result.videoThumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'video_length':
          result.videoLength = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url_string':
          result.urlString = serializers.deserialize(value,
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

class _$FrontVideosRecord extends FrontVideosRecord {
  @override
  final String videoName;
  @override
  final int videoId;
  @override
  final String videoLink;
  @override
  final String videoThumbnail;
  @override
  final String videoLength;
  @override
  final String urlString;
  @override
  final DocumentReference<Object> reference;

  factory _$FrontVideosRecord(
          [void Function(FrontVideosRecordBuilder) updates]) =>
      (new FrontVideosRecordBuilder()..update(updates)).build();

  _$FrontVideosRecord._(
      {this.videoName,
      this.videoId,
      this.videoLink,
      this.videoThumbnail,
      this.videoLength,
      this.urlString,
      this.reference})
      : super._();

  @override
  FrontVideosRecord rebuild(void Function(FrontVideosRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FrontVideosRecordBuilder toBuilder() =>
      new FrontVideosRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FrontVideosRecord &&
        videoName == other.videoName &&
        videoId == other.videoId &&
        videoLink == other.videoLink &&
        videoThumbnail == other.videoThumbnail &&
        videoLength == other.videoLength &&
        urlString == other.urlString &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, videoName.hashCode), videoId.hashCode),
                        videoLink.hashCode),
                    videoThumbnail.hashCode),
                videoLength.hashCode),
            urlString.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FrontVideosRecord')
          ..add('videoName', videoName)
          ..add('videoId', videoId)
          ..add('videoLink', videoLink)
          ..add('videoThumbnail', videoThumbnail)
          ..add('videoLength', videoLength)
          ..add('urlString', urlString)
          ..add('reference', reference))
        .toString();
  }
}

class FrontVideosRecordBuilder
    implements Builder<FrontVideosRecord, FrontVideosRecordBuilder> {
  _$FrontVideosRecord _$v;

  String _videoName;
  String get videoName => _$this._videoName;
  set videoName(String videoName) => _$this._videoName = videoName;

  int _videoId;
  int get videoId => _$this._videoId;
  set videoId(int videoId) => _$this._videoId = videoId;

  String _videoLink;
  String get videoLink => _$this._videoLink;
  set videoLink(String videoLink) => _$this._videoLink = videoLink;

  String _videoThumbnail;
  String get videoThumbnail => _$this._videoThumbnail;
  set videoThumbnail(String videoThumbnail) =>
      _$this._videoThumbnail = videoThumbnail;

  String _videoLength;
  String get videoLength => _$this._videoLength;
  set videoLength(String videoLength) => _$this._videoLength = videoLength;

  String _urlString;
  String get urlString => _$this._urlString;
  set urlString(String urlString) => _$this._urlString = urlString;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  FrontVideosRecordBuilder() {
    FrontVideosRecord._initializeBuilder(this);
  }

  FrontVideosRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _videoName = $v.videoName;
      _videoId = $v.videoId;
      _videoLink = $v.videoLink;
      _videoThumbnail = $v.videoThumbnail;
      _videoLength = $v.videoLength;
      _urlString = $v.urlString;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FrontVideosRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FrontVideosRecord;
  }

  @override
  void update(void Function(FrontVideosRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FrontVideosRecord build() {
    final _$result = _$v ??
        new _$FrontVideosRecord._(
            videoName: videoName,
            videoId: videoId,
            videoLink: videoLink,
            videoThumbnail: videoThumbnail,
            videoLength: videoLength,
            urlString: urlString,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
