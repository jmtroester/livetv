import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SermonTopicRecord extends FirestoreRecord {
  SermonTopicRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sermon_topic_name" field.
  String? _sermonTopicName;
  String get sermonTopicName => _sermonTopicName ?? '';
  bool hasSermonTopicName() => _sermonTopicName != null;

  void _initializeFields() {
    _sermonTopicName = snapshotData['sermon_topic_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sermon_topic');

  static Stream<SermonTopicRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SermonTopicRecord.fromSnapshot(s));

  static Future<SermonTopicRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SermonTopicRecord.fromSnapshot(s));

  static SermonTopicRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SermonTopicRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SermonTopicRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SermonTopicRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SermonTopicRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SermonTopicRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSermonTopicRecordData({
  String? sermonTopicName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sermon_topic_name': sermonTopicName,
    }.withoutNulls,
  );

  return firestoreData;
}

class SermonTopicRecordDocumentEquality implements Equality<SermonTopicRecord> {
  const SermonTopicRecordDocumentEquality();

  @override
  bool equals(SermonTopicRecord? e1, SermonTopicRecord? e2) {
    return e1?.sermonTopicName == e2?.sermonTopicName;
  }

  @override
  int hash(SermonTopicRecord? e) =>
      const ListEquality().hash([e?.sermonTopicName]);

  @override
  bool isValidKey(Object? o) => o is SermonTopicRecord;
}
