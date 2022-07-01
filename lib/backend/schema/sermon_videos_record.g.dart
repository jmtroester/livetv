// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sermon_videos_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SermonVideosRecord> _$sermonVideosRecordSerializer =
    new _$SermonVideosRecordSerializer();

class _$SermonVideosRecordSerializer
    implements StructuredSerializer<SermonVideosRecord> {
  @override
  final Iterable<Type> types = const [SermonVideosRecord, _$SermonVideosRecord];
  @override
  final String wireName = 'SermonVideosRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, SermonVideosRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
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
    value = object.sermonName;
    if (value != null) {
      result
        ..add('sermon_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sermonThumbnail;
    if (value != null) {
      result
        ..add('sermon_thumbnail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.audioLink;
    if (value != null) {
      result
        ..add('audio_link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.audioId;
    if (value != null) {
      result
        ..add('audio_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  SermonVideosRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SermonVideosRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'video_id':
          result.videoId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'video_link':
          result.videoLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sermon_name':
          result.sermonName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sermon_thumbnail':
          result.sermonThumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'audio_link':
          result.audioLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'audio_id':
          result.audioId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$SermonVideosRecord extends SermonVideosRecord {
  @override
  final int videoId;
  @override
  final String videoLink;
  @override
  final String sermonName;
  @override
  final String sermonThumbnail;
  @override
  final String audioLink;
  @override
  final String text;
  @override
  final int audioId;
  @override
  final String urlString;
  @override
  final DocumentReference<Object> reference;

  factory _$SermonVideosRecord(
          [void Function(SermonVideosRecordBuilder) updates]) =>
      (new SermonVideosRecordBuilder()..update(updates)).build();

  _$SermonVideosRecord._(
      {this.videoId,
      this.videoLink,
      this.sermonName,
      this.sermonThumbnail,
      this.audioLink,
      this.text,
      this.audioId,
      this.urlString,
      this.reference})
      : super._();

  @override
  SermonVideosRecord rebuild(
          void Function(SermonVideosRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SermonVideosRecordBuilder toBuilder() =>
      new SermonVideosRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SermonVideosRecord &&
        videoId == other.videoId &&
        videoLink == other.videoLink &&
        sermonName == other.sermonName &&
        sermonThumbnail == other.sermonThumbnail &&
        audioLink == other.audioLink &&
        text == other.text &&
        audioId == other.audioId &&
        urlString == other.urlString &&
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
                            $jc(
                                $jc($jc(0, videoId.hashCode),
                                    videoLink.hashCode),
                                sermonName.hashCode),
                            sermonThumbnail.hashCode),
                        audioLink.hashCode),
                    text.hashCode),
                audioId.hashCode),
            urlString.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SermonVideosRecord')
          ..add('videoId', videoId)
          ..add('videoLink', videoLink)
          ..add('sermonName', sermonName)
          ..add('sermonThumbnail', sermonThumbnail)
          ..add('audioLink', audioLink)
          ..add('text', text)
          ..add('audioId', audioId)
          ..add('urlString', urlString)
          ..add('reference', reference))
        .toString();
  }
}

class SermonVideosRecordBuilder
    implements Builder<SermonVideosRecord, SermonVideosRecordBuilder> {
  _$SermonVideosRecord _$v;

  int _videoId;
  int get videoId => _$this._videoId;
  set videoId(int videoId) => _$this._videoId = videoId;

  String _videoLink;
  String get videoLink => _$this._videoLink;
  set videoLink(String videoLink) => _$this._videoLink = videoLink;

  String _sermonName;
  String get sermonName => _$this._sermonName;
  set sermonName(String sermonName) => _$this._sermonName = sermonName;

  String _sermonThumbnail;
  String get sermonThumbnail => _$this._sermonThumbnail;
  set sermonThumbnail(String sermonThumbnail) =>
      _$this._sermonThumbnail = sermonThumbnail;

  String _audioLink;
  String get audioLink => _$this._audioLink;
  set audioLink(String audioLink) => _$this._audioLink = audioLink;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  int _audioId;
  int get audioId => _$this._audioId;
  set audioId(int audioId) => _$this._audioId = audioId;

  String _urlString;
  String get urlString => _$this._urlString;
  set urlString(String urlString) => _$this._urlString = urlString;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  SermonVideosRecordBuilder() {
    SermonVideosRecord._initializeBuilder(this);
  }

  SermonVideosRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _videoId = $v.videoId;
      _videoLink = $v.videoLink;
      _sermonName = $v.sermonName;
      _sermonThumbnail = $v.sermonThumbnail;
      _audioLink = $v.audioLink;
      _text = $v.text;
      _audioId = $v.audioId;
      _urlString = $v.urlString;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SermonVideosRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SermonVideosRecord;
  }

  @override
  void update(void Function(SermonVideosRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SermonVideosRecord build() {
    final _$result = _$v ??
        new _$SermonVideosRecord._(
            videoId: videoId,
            videoLink: videoLink,
            sermonName: sermonName,
            sermonThumbnail: sermonThumbnail,
            audioLink: audioLink,
            text: text,
            audioId: audioId,
            urlString: urlString,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
