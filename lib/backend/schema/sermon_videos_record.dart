import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sermon_videos_record.g.dart';

abstract class SermonVideosRecord
    implements Built<SermonVideosRecord, SermonVideosRecordBuilder> {
  static Serializer<SermonVideosRecord> get serializer =>
      _$sermonVideosRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'video_id')
  int get videoId;

  @nullable
  @BuiltValueField(wireName: 'video_link')
  String get videoLink;

  @nullable
  @BuiltValueField(wireName: 'sermon_name')
  String get sermonName;

  @nullable
  @BuiltValueField(wireName: 'sermon_thumbnail')
  String get sermonThumbnail;

  @nullable
  @BuiltValueField(wireName: 'audio_link')
  String get audioLink;

  @nullable
  String get text;

  @nullable
  @BuiltValueField(wireName: 'audio_id')
  int get audioId;

  @nullable
  @BuiltValueField(wireName: 'url_string')
  String get urlString;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SermonVideosRecordBuilder builder) => builder
    ..videoId = 0
    ..videoLink = ''
    ..sermonName = ''
    ..sermonThumbnail = ''
    ..audioLink = ''
    ..text = ''
    ..audioId = 0
    ..urlString = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sermon_videos');

  static Stream<SermonVideosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SermonVideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  SermonVideosRecord._();
  factory SermonVideosRecord(
          [void Function(SermonVideosRecordBuilder) updates]) =
      _$SermonVideosRecord;

  static SermonVideosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSermonVideosRecordData({
  int videoId,
  String videoLink,
  String sermonName,
  String sermonThumbnail,
  String audioLink,
  String text,
  int audioId,
  String urlString,
}) =>
    serializers.toFirestore(
        SermonVideosRecord.serializer,
        SermonVideosRecord((s) => s
          ..videoId = videoId
          ..videoLink = videoLink
          ..sermonName = sermonName
          ..sermonThumbnail = sermonThumbnail
          ..audioLink = audioLink
          ..text = text
          ..audioId = audioId
          ..urlString = urlString));
