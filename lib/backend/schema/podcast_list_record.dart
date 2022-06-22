import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'podcast_list_record.g.dart';

abstract class PodcastListRecord
    implements Built<PodcastListRecord, PodcastListRecordBuilder> {
  static Serializer<PodcastListRecord> get serializer =>
      _$podcastListRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'podcast_id')
  int get podcastId;

  @nullable
  @BuiltValueField(wireName: 'podcast_link')
  String get podcastLink;

  @nullable
  @BuiltValueField(wireName: 'podcast_name')
  String get podcastName;

  @nullable
  @BuiltValueField(wireName: 'embed_code')
  String get embedCode;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PodcastListRecordBuilder builder) => builder
    ..podcastId = 0
    ..podcastLink = ''
    ..podcastName = ''
    ..embedCode = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('podcast_list');

  static Stream<PodcastListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PodcastListRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PodcastListRecord._();
  factory PodcastListRecord([void Function(PodcastListRecordBuilder) updates]) =
      _$PodcastListRecord;

  static PodcastListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPodcastListRecordData({
  int podcastId,
  String podcastLink,
  String podcastName,
  String embedCode,
}) =>
    serializers.toFirestore(
        PodcastListRecord.serializer,
        PodcastListRecord((p) => p
          ..podcastId = podcastId
          ..podcastLink = podcastLink
          ..podcastName = podcastName
          ..embedCode = embedCode));
