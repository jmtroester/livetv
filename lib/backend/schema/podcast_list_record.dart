import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PodcastListRecord extends FirestoreRecord {
  PodcastListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "podcast_id" field.
  int? _podcastId;
  int get podcastId => _podcastId ?? 0;
  bool hasPodcastId() => _podcastId != null;

  // "podcast_link" field.
  String? _podcastLink;
  String get podcastLink => _podcastLink ?? '';
  bool hasPodcastLink() => _podcastLink != null;

  // "podcast_name" field.
  String? _podcastName;
  String get podcastName => _podcastName ?? '';
  bool hasPodcastName() => _podcastName != null;

  // "embed_code" field.
  String? _embedCode;
  String get embedCode => _embedCode ?? '';
  bool hasEmbedCode() => _embedCode != null;

  void _initializeFields() {
    _podcastId = castToType<int>(snapshotData['podcast_id']);
    _podcastLink = snapshotData['podcast_link'] as String?;
    _podcastName = snapshotData['podcast_name'] as String?;
    _embedCode = snapshotData['embed_code'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('podcast_list');

  static Stream<PodcastListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PodcastListRecord.fromSnapshot(s));

  static Future<PodcastListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PodcastListRecord.fromSnapshot(s));

  static PodcastListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PodcastListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PodcastListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PodcastListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PodcastListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PodcastListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPodcastListRecordData({
  int? podcastId,
  String? podcastLink,
  String? podcastName,
  String? embedCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'podcast_id': podcastId,
      'podcast_link': podcastLink,
      'podcast_name': podcastName,
      'embed_code': embedCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class PodcastListRecordDocumentEquality implements Equality<PodcastListRecord> {
  const PodcastListRecordDocumentEquality();

  @override
  bool equals(PodcastListRecord? e1, PodcastListRecord? e2) {
    return e1?.podcastId == e2?.podcastId &&
        e1?.podcastLink == e2?.podcastLink &&
        e1?.podcastName == e2?.podcastName &&
        e1?.embedCode == e2?.embedCode;
  }

  @override
  int hash(PodcastListRecord? e) => const ListEquality()
      .hash([e?.podcastId, e?.podcastLink, e?.podcastName, e?.embedCode]);

  @override
  bool isValidKey(Object? o) => o is PodcastListRecord;
}
