import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LiveVideoPlaylistsRecord extends FirestoreRecord {
  LiveVideoPlaylistsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('live_video_playlists')
          : FirebaseFirestore.instance.collectionGroup('live_video_playlists');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('live_video_playlists').doc();

  static Stream<LiveVideoPlaylistsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LiveVideoPlaylistsRecord.fromSnapshot(s));

  static Future<LiveVideoPlaylistsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => LiveVideoPlaylistsRecord.fromSnapshot(s));

  static LiveVideoPlaylistsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LiveVideoPlaylistsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LiveVideoPlaylistsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LiveVideoPlaylistsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LiveVideoPlaylistsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LiveVideoPlaylistsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLiveVideoPlaylistsRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class LiveVideoPlaylistsRecordDocumentEquality
    implements Equality<LiveVideoPlaylistsRecord> {
  const LiveVideoPlaylistsRecordDocumentEquality();

  @override
  bool equals(LiveVideoPlaylistsRecord? e1, LiveVideoPlaylistsRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(LiveVideoPlaylistsRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is LiveVideoPlaylistsRecord;
}
