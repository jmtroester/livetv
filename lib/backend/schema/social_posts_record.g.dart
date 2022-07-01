// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_posts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SocialPostsRecord> _$socialPostsRecordSerializer =
    new _$SocialPostsRecordSerializer();

class _$SocialPostsRecordSerializer
    implements StructuredSerializer<SocialPostsRecord> {
  @override
  final Iterable<Type> types = const [SocialPostsRecord, _$SocialPostsRecord];
  @override
  final String wireName = 'SocialPostsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, SocialPostsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.content;
    if (value != null) {
      result
        ..add('content')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.likes;
    if (value != null) {
      result
        ..add('likes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.photo;
    if (value != null) {
      result
        ..add('photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postedBy;
    if (value != null) {
      result
        ..add('posted_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.postedTime;
    if (value != null) {
      result
        ..add('posted_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.videoLink;
    if (value != null) {
      result
        ..add('video_link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.videoName;
    if (value != null) {
      result
        ..add('video_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isVideoPost;
    if (value != null) {
      result
        ..add('is_video_post')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  SocialPostsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SocialPostsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'likes':
          result.likes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'photo':
          result.photo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'posted_by':
          result.postedBy = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'posted_time':
          result.postedTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'video_link':
          result.videoLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'video_name':
          result.videoName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'is_video_post':
          result.isVideoPost = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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

class _$SocialPostsRecord extends SocialPostsRecord {
  @override
  final String content;
  @override
  final BuiltList<DocumentReference<Object>> likes;
  @override
  final String photo;
  @override
  final DocumentReference<Object> postedBy;
  @override
  final DateTime postedTime;
  @override
  final String videoLink;
  @override
  final String videoName;
  @override
  final bool isVideoPost;
  @override
  final DocumentReference<Object> reference;

  factory _$SocialPostsRecord(
          [void Function(SocialPostsRecordBuilder) updates]) =>
      (new SocialPostsRecordBuilder()..update(updates)).build();

  _$SocialPostsRecord._(
      {this.content,
      this.likes,
      this.photo,
      this.postedBy,
      this.postedTime,
      this.videoLink,
      this.videoName,
      this.isVideoPost,
      this.reference})
      : super._();

  @override
  SocialPostsRecord rebuild(void Function(SocialPostsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SocialPostsRecordBuilder toBuilder() =>
      new SocialPostsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SocialPostsRecord &&
        content == other.content &&
        likes == other.likes &&
        photo == other.photo &&
        postedBy == other.postedBy &&
        postedTime == other.postedTime &&
        videoLink == other.videoLink &&
        videoName == other.videoName &&
        isVideoPost == other.isVideoPost &&
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
                            $jc($jc($jc(0, content.hashCode), likes.hashCode),
                                photo.hashCode),
                            postedBy.hashCode),
                        postedTime.hashCode),
                    videoLink.hashCode),
                videoName.hashCode),
            isVideoPost.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SocialPostsRecord')
          ..add('content', content)
          ..add('likes', likes)
          ..add('photo', photo)
          ..add('postedBy', postedBy)
          ..add('postedTime', postedTime)
          ..add('videoLink', videoLink)
          ..add('videoName', videoName)
          ..add('isVideoPost', isVideoPost)
          ..add('reference', reference))
        .toString();
  }
}

class SocialPostsRecordBuilder
    implements Builder<SocialPostsRecord, SocialPostsRecordBuilder> {
  _$SocialPostsRecord _$v;

  String _content;
  String get content => _$this._content;
  set content(String content) => _$this._content = content;

  ListBuilder<DocumentReference<Object>> _likes;
  ListBuilder<DocumentReference<Object>> get likes =>
      _$this._likes ??= new ListBuilder<DocumentReference<Object>>();
  set likes(ListBuilder<DocumentReference<Object>> likes) =>
      _$this._likes = likes;

  String _photo;
  String get photo => _$this._photo;
  set photo(String photo) => _$this._photo = photo;

  DocumentReference<Object> _postedBy;
  DocumentReference<Object> get postedBy => _$this._postedBy;
  set postedBy(DocumentReference<Object> postedBy) =>
      _$this._postedBy = postedBy;

  DateTime _postedTime;
  DateTime get postedTime => _$this._postedTime;
  set postedTime(DateTime postedTime) => _$this._postedTime = postedTime;

  String _videoLink;
  String get videoLink => _$this._videoLink;
  set videoLink(String videoLink) => _$this._videoLink = videoLink;

  String _videoName;
  String get videoName => _$this._videoName;
  set videoName(String videoName) => _$this._videoName = videoName;

  bool _isVideoPost;
  bool get isVideoPost => _$this._isVideoPost;
  set isVideoPost(bool isVideoPost) => _$this._isVideoPost = isVideoPost;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  SocialPostsRecordBuilder() {
    SocialPostsRecord._initializeBuilder(this);
  }

  SocialPostsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _content = $v.content;
      _likes = $v.likes?.toBuilder();
      _photo = $v.photo;
      _postedBy = $v.postedBy;
      _postedTime = $v.postedTime;
      _videoLink = $v.videoLink;
      _videoName = $v.videoName;
      _isVideoPost = $v.isVideoPost;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SocialPostsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SocialPostsRecord;
  }

  @override
  void update(void Function(SocialPostsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SocialPostsRecord build() {
    _$SocialPostsRecord _$result;
    try {
      _$result = _$v ??
          new _$SocialPostsRecord._(
              content: content,
              likes: _likes?.build(),
              photo: photo,
              postedBy: postedBy,
              postedTime: postedTime,
              videoLink: videoLink,
              videoName: videoName,
              isVideoPost: isVideoPost,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'likes';
        _likes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SocialPostsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
