import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NonSermonPodcastRecord extends FirestoreRecord {
  NonSermonPodcastRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "podcast_id" field.
  int? _podcastId;
  int get podcastId => _podcastId ?? 0;
  bool hasPodcastId() => _podcastId != null;

  // "podcast_name" field.
  String? _podcastName;
  String get podcastName => _podcastName ?? '';
  bool hasPodcastName() => _podcastName != null;

  // "podcast_link" field.
  String? _podcastLink;
  String get podcastLink => _podcastLink ?? '';
  bool hasPodcastLink() => _podcastLink != null;

  // "meta" field.
  String? _meta;
  String get meta => _meta ?? '';
  bool hasMeta() => _meta != null;

  // "podcast_url" field.
  String? _podcastUrl;
  String get podcastUrl => _podcastUrl ?? '';
  bool hasPodcastUrl() => _podcastUrl != null;

  void _initializeFields() {
    _podcastId = castToType<int>(snapshotData['podcast_id']);
    _podcastName = snapshotData['podcast_name'] as String?;
    _podcastLink = snapshotData['podcast_link'] as String?;
    _meta = snapshotData['meta'] as String?;
    _podcastUrl = snapshotData['podcast_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('non_sermon_podcast');

  static Stream<NonSermonPodcastRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NonSermonPodcastRecord.fromSnapshot(s));

  static Future<NonSermonPodcastRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => NonSermonPodcastRecord.fromSnapshot(s));

  static NonSermonPodcastRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NonSermonPodcastRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NonSermonPodcastRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NonSermonPodcastRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NonSermonPodcastRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NonSermonPodcastRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNonSermonPodcastRecordData({
  int? podcastId,
  String? podcastName,
  String? podcastLink,
  String? meta,
  String? podcastUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'podcast_id': podcastId,
      'podcast_name': podcastName,
      'podcast_link': podcastLink,
      'meta': meta,
      'podcast_url': podcastUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class NonSermonPodcastRecordDocumentEquality
    implements Equality<NonSermonPodcastRecord> {
  const NonSermonPodcastRecordDocumentEquality();

  @override
  bool equals(NonSermonPodcastRecord? e1, NonSermonPodcastRecord? e2) {
    return e1?.podcastId == e2?.podcastId &&
        e1?.podcastName == e2?.podcastName &&
        e1?.podcastLink == e2?.podcastLink &&
        e1?.meta == e2?.meta &&
        e1?.podcastUrl == e2?.podcastUrl;
  }

  @override
  int hash(NonSermonPodcastRecord? e) => const ListEquality().hash(
      [e?.podcastId, e?.podcastName, e?.podcastLink, e?.meta, e?.podcastUrl]);

  @override
  bool isValidKey(Object? o) => o is NonSermonPodcastRecord;
}
