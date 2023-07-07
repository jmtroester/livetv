import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CatechismsRecord extends FirestoreRecord {
  CatechismsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "catechism_id" field.
  int? _catechismId;
  int get catechismId => _catechismId ?? 0;
  bool hasCatechismId() => _catechismId != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  bool hasAnswer() => _answer != null;

  // "verse1" field.
  String? _verse1;
  String get verse1 => _verse1 ?? '';
  bool hasVerse1() => _verse1 != null;

  // "verse2" field.
  String? _verse2;
  String get verse2 => _verse2 ?? '';
  bool hasVerse2() => _verse2 != null;

  // "verse3" field.
  String? _verse3;
  String get verse3 => _verse3 ?? '';
  bool hasVerse3() => _verse3 != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "c_20" field.
  String? _c20;
  String get c20 => _c20 ?? '';
  bool hasC20() => _c20 != null;

  // "c_40" field.
  String? _c40;
  String get c40 => _c40 ?? '';
  bool hasC40() => _c40 != null;

  // "c_60" field.
  String? _c60;
  String get c60 => _c60 ?? '';
  bool hasC60() => _c60 != null;

  // "c_80" field.
  String? _c80;
  String get c80 => _c80 ?? '';
  bool hasC80() => _c80 != null;

  // "c_100" field.
  String? _c100;
  String get c100 => _c100 ?? '';
  bool hasC100() => _c100 != null;

  void _initializeFields() {
    _catechismId = castToType<int>(snapshotData['catechism_id']);
    _question = snapshotData['question'] as String?;
    _answer = snapshotData['answer'] as String?;
    _verse1 = snapshotData['verse1'] as String?;
    _verse2 = snapshotData['verse2'] as String?;
    _verse3 = snapshotData['verse3'] as String?;
    _image = snapshotData['image'] as String?;
    _c20 = snapshotData['c_20'] as String?;
    _c40 = snapshotData['c_40'] as String?;
    _c60 = snapshotData['c_60'] as String?;
    _c80 = snapshotData['c_80'] as String?;
    _c100 = snapshotData['c_100'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('catechisms');

  static Stream<CatechismsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CatechismsRecord.fromSnapshot(s));

  static Future<CatechismsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CatechismsRecord.fromSnapshot(s));

  static CatechismsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CatechismsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CatechismsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CatechismsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CatechismsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CatechismsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCatechismsRecordData({
  int? catechismId,
  String? question,
  String? answer,
  String? verse1,
  String? verse2,
  String? verse3,
  String? image,
  String? c20,
  String? c40,
  String? c60,
  String? c80,
  String? c100,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'catechism_id': catechismId,
      'question': question,
      'answer': answer,
      'verse1': verse1,
      'verse2': verse2,
      'verse3': verse3,
      'image': image,
      'c_20': c20,
      'c_40': c40,
      'c_60': c60,
      'c_80': c80,
      'c_100': c100,
    }.withoutNulls,
  );

  return firestoreData;
}

class CatechismsRecordDocumentEquality implements Equality<CatechismsRecord> {
  const CatechismsRecordDocumentEquality();

  @override
  bool equals(CatechismsRecord? e1, CatechismsRecord? e2) {
    return e1?.catechismId == e2?.catechismId &&
        e1?.question == e2?.question &&
        e1?.answer == e2?.answer &&
        e1?.verse1 == e2?.verse1 &&
        e1?.verse2 == e2?.verse2 &&
        e1?.verse3 == e2?.verse3 &&
        e1?.image == e2?.image &&
        e1?.c20 == e2?.c20 &&
        e1?.c40 == e2?.c40 &&
        e1?.c60 == e2?.c60 &&
        e1?.c80 == e2?.c80 &&
        e1?.c100 == e2?.c100;
  }

  @override
  int hash(CatechismsRecord? e) => const ListEquality().hash([
        e?.catechismId,
        e?.question,
        e?.answer,
        e?.verse1,
        e?.verse2,
        e?.verse3,
        e?.image,
        e?.c20,
        e?.c40,
        e?.c60,
        e?.c80,
        e?.c100
      ]);

  @override
  bool isValidKey(Object? o) => o is CatechismsRecord;
}
