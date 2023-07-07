import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SermonSeriesRecord extends FirestoreRecord {
  SermonSeriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sermon_series_name" field.
  String? _sermonSeriesName;
  String get sermonSeriesName => _sermonSeriesName ?? '';
  bool hasSermonSeriesName() => _sermonSeriesName != null;

  // "series_graphic" field.
  String? _seriesGraphic;
  String get seriesGraphic => _seriesGraphic ?? '';
  bool hasSeriesGraphic() => _seriesGraphic != null;

  void _initializeFields() {
    _sermonSeriesName = snapshotData['sermon_series_name'] as String?;
    _seriesGraphic = snapshotData['series_graphic'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sermon_series');

  static Stream<SermonSeriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SermonSeriesRecord.fromSnapshot(s));

  static Future<SermonSeriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SermonSeriesRecord.fromSnapshot(s));

  static SermonSeriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SermonSeriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SermonSeriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SermonSeriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SermonSeriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SermonSeriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSermonSeriesRecordData({
  String? sermonSeriesName,
  String? seriesGraphic,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sermon_series_name': sermonSeriesName,
      'series_graphic': seriesGraphic,
    }.withoutNulls,
  );

  return firestoreData;
}

class SermonSeriesRecordDocumentEquality
    implements Equality<SermonSeriesRecord> {
  const SermonSeriesRecordDocumentEquality();

  @override
  bool equals(SermonSeriesRecord? e1, SermonSeriesRecord? e2) {
    return e1?.sermonSeriesName == e2?.sermonSeriesName &&
        e1?.seriesGraphic == e2?.seriesGraphic;
  }

  @override
  int hash(SermonSeriesRecord? e) =>
      const ListEquality().hash([e?.sermonSeriesName, e?.seriesGraphic]);

  @override
  bool isValidKey(Object? o) => o is SermonSeriesRecord;
}
