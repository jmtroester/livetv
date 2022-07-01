import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'front_videos_record.g.dart';

abstract class FrontVideosRecord
    implements Built<FrontVideosRecord, FrontVideosRecordBuilder> {
  static Serializer<FrontVideosRecord> get serializer =>
      _$frontVideosRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'video_name')
  String get videoName;

  @nullable
  @BuiltValueField(wireName: 'video_id')
  int get videoId;

  @nullable
  @BuiltValueField(wireName: 'video_link')
  String get videoLink;

  @nullable
  @BuiltValueField(wireName: 'video_thumbnail')
  String get videoThumbnail;

  @nullable
  @BuiltValueField(wireName: 'video_length')
  String get videoLength;

  @nullable
  @BuiltValueField(wireName: 'url_string')
  String get urlString;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(FrontVideosRecordBuilder builder) => builder
    ..videoName = ''
    ..videoId = 0
    ..videoLink = ''
    ..videoThumbnail = ''
    ..videoLength = ''
    ..urlString = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('front_videos');

  static Stream<FrontVideosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<FrontVideosRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  FrontVideosRecord._();
  factory FrontVideosRecord([void Function(FrontVideosRecordBuilder) updates]) =
      _$FrontVideosRecord;

  static FrontVideosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createFrontVideosRecordData({
  String videoName,
  int videoId,
  String videoLink,
  String videoThumbnail,
  String videoLength,
  String urlString,
}) =>
    serializers.toFirestore(
        FrontVideosRecord.serializer,
        FrontVideosRecord((f) => f
          ..videoName = videoName
          ..videoId = videoId
          ..videoLink = videoLink
          ..videoThumbnail = videoThumbnail
          ..videoLength = videoLength
          ..urlString = urlString));
