import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LiveVideoRecord extends FirestoreRecord {
  LiveVideoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "is_live" field.
  bool? _isLive;
  bool get isLive => _isLive ?? false;
  bool hasIsLive() => _isLive != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "playlist" field.
  DocumentReference? _playlist;
  DocumentReference? get playlist => _playlist;
  bool hasPlaylist() => _playlist != null;

  // "video_id" field.
  int? _videoId;
  int get videoId => _videoId ?? 0;
  bool hasVideoId() => _videoId != null;

  void _initializeFields() {
    _isLive = snapshotData['is_live'] as bool?;
    _name = snapshotData['name'] as String?;
    _url = snapshotData['url'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _playlist = snapshotData['playlist'] as DocumentReference?;
    _videoId = castToType<int>(snapshotData['video_id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('live_video');

  static Stream<LiveVideoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LiveVideoRecord.fromSnapshot(s));

  static Future<LiveVideoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LiveVideoRecord.fromSnapshot(s));

  static LiveVideoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LiveVideoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LiveVideoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LiveVideoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LiveVideoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LiveVideoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLiveVideoRecordData({
  bool? isLive,
  String? name,
  String? url,
  DateTime? time,
  DocumentReference? playlist,
  int? videoId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'is_live': isLive,
      'name': name,
      'url': url,
      'time': time,
      'playlist': playlist,
      'video_id': videoId,
    }.withoutNulls,
  );

  return firestoreData;
}

class LiveVideoRecordDocumentEquality implements Equality<LiveVideoRecord> {
  const LiveVideoRecordDocumentEquality();

  @override
  bool equals(LiveVideoRecord? e1, LiveVideoRecord? e2) {
    return e1?.isLive == e2?.isLive &&
        e1?.name == e2?.name &&
        e1?.url == e2?.url &&
        e1?.time == e2?.time &&
        e1?.playlist == e2?.playlist &&
        e1?.videoId == e2?.videoId;
  }

  @override
  int hash(LiveVideoRecord? e) => const ListEquality()
      .hash([e?.isLive, e?.name, e?.url, e?.time, e?.playlist, e?.videoId]);

  @override
  bool isValidKey(Object? o) => o is LiveVideoRecord;
}
