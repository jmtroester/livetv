import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'social_posts_record.g.dart';

abstract class SocialPostsRecord
    implements Built<SocialPostsRecord, SocialPostsRecordBuilder> {
  static Serializer<SocialPostsRecord> get serializer =>
      _$socialPostsRecordSerializer;

  @nullable
  String get content;

  @nullable
  BuiltList<DocumentReference> get likes;

  @nullable
  String get photo;

  @nullable
  @BuiltValueField(wireName: 'posted_by')
  DocumentReference get postedBy;

  @nullable
  @BuiltValueField(wireName: 'posted_time')
  DateTime get postedTime;

  @nullable
  @BuiltValueField(wireName: 'video_link')
  String get videoLink;

  @nullable
  @BuiltValueField(wireName: 'video_name')
  String get videoName;

  @nullable
  @BuiltValueField(wireName: 'is_video_post')
  bool get isVideoPost;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SocialPostsRecordBuilder builder) => builder
    ..content = ''
    ..likes = ListBuilder()
    ..photo = ''
    ..videoLink = ''
    ..videoName = ''
    ..isVideoPost = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('social_posts');

  static Stream<SocialPostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SocialPostsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SocialPostsRecord._();
  factory SocialPostsRecord([void Function(SocialPostsRecordBuilder) updates]) =
      _$SocialPostsRecord;

  static SocialPostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSocialPostsRecordData({
  String content,
  String photo,
  DocumentReference postedBy,
  DateTime postedTime,
  String videoLink,
  String videoName,
  bool isVideoPost,
}) =>
    serializers.toFirestore(
        SocialPostsRecord.serializer,
        SocialPostsRecord((s) => s
          ..content = content
          ..likes = null
          ..photo = photo
          ..postedBy = postedBy
          ..postedTime = postedTime
          ..videoLink = videoLink
          ..videoName = videoName
          ..isVideoPost = isVideoPost));
