import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LiveChurchRecord extends FirestoreRecord {
  LiveChurchRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "text_no" field.
  String? _textNo;
  String get textNo => _textNo ?? '';
  bool hasTextNo() => _textNo != null;

  // "guide_link" field.
  String? _guideLink;
  String get guideLink => _guideLink ?? '';
  bool hasGuideLink() => _guideLink != null;

  void _initializeFields() {
    _textNo = snapshotData['text_no'] as String?;
    _guideLink = snapshotData['guide_link'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('live_church');

  static Stream<LiveChurchRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LiveChurchRecord.fromSnapshot(s));

  static Future<LiveChurchRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LiveChurchRecord.fromSnapshot(s));

  static LiveChurchRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LiveChurchRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LiveChurchRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LiveChurchRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LiveChurchRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LiveChurchRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLiveChurchRecordData({
  String? textNo,
  String? guideLink,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text_no': textNo,
      'guide_link': guideLink,
    }.withoutNulls,
  );

  return firestoreData;
}

class LiveChurchRecordDocumentEquality implements Equality<LiveChurchRecord> {
  const LiveChurchRecordDocumentEquality();

  @override
  bool equals(LiveChurchRecord? e1, LiveChurchRecord? e2) {
    return e1?.textNo == e2?.textNo && e1?.guideLink == e2?.guideLink;
  }

  @override
  int hash(LiveChurchRecord? e) =>
      const ListEquality().hash([e?.textNo, e?.guideLink]);

  @override
  bool isValidKey(Object? o) => o is LiveChurchRecord;
}
