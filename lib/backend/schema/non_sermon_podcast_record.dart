import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'non_sermon_podcast_record.g.dart';

abstract class NonSermonPodcastRecord
    implements Built<NonSermonPodcastRecord, NonSermonPodcastRecordBuilder> {
  static Serializer<NonSermonPodcastRecord> get serializer =>
      _$nonSermonPodcastRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'podcast_id')
  int get podcastId;

  @nullable
  @BuiltValueField(wireName: 'podcast_name')
  String get podcastName;

  @nullable
  @BuiltValueField(wireName: 'podcast_link')
  String get podcastLink;

  @nullable
  String get meta;

  @nullable
  @BuiltValueField(wireName: 'podcast_url')
  String get podcastUrl;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(NonSermonPodcastRecordBuilder builder) =>
      builder
        ..podcastId = 0
        ..podcastName = ''
        ..podcastLink = ''
        ..meta = ''
        ..podcastUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('non_sermon_podcast');

  static Stream<NonSermonPodcastRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<NonSermonPodcastRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  NonSermonPodcastRecord._();
  factory NonSermonPodcastRecord(
          [void Function(NonSermonPodcastRecordBuilder) updates]) =
      _$NonSermonPodcastRecord;

  static NonSermonPodcastRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createNonSermonPodcastRecordData({
  int podcastId,
  String podcastName,
  String podcastLink,
  String meta,
  String podcastUrl,
}) =>
    serializers.toFirestore(
        NonSermonPodcastRecord.serializer,
        NonSermonPodcastRecord((n) => n
          ..podcastId = podcastId
          ..podcastName = podcastName
          ..podcastLink = podcastLink
          ..meta = meta
          ..podcastUrl = podcastUrl));
