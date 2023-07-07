import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BibleBookIdsRecord extends FirestoreRecord {
  BibleBookIdsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bible_id" field.
  int? _bibleId;
  int get bibleId => _bibleId ?? 0;
  bool hasBibleId() => _bibleId != null;

  // "bible_book_name" field.
  String? _bibleBookName;
  String get bibleBookName => _bibleBookName ?? '';
  bool hasBibleBookName() => _bibleBookName != null;

  void _initializeFields() {
    _bibleId = castToType<int>(snapshotData['bible_id']);
    _bibleBookName = snapshotData['bible_book_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bible_book_ids');

  static Stream<BibleBookIdsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BibleBookIdsRecord.fromSnapshot(s));

  static Future<BibleBookIdsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BibleBookIdsRecord.fromSnapshot(s));

  static BibleBookIdsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BibleBookIdsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BibleBookIdsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BibleBookIdsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BibleBookIdsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BibleBookIdsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBibleBookIdsRecordData({
  int? bibleId,
  String? bibleBookName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bible_id': bibleId,
      'bible_book_name': bibleBookName,
    }.withoutNulls,
  );

  return firestoreData;
}

class BibleBookIdsRecordDocumentEquality
    implements Equality<BibleBookIdsRecord> {
  const BibleBookIdsRecordDocumentEquality();

  @override
  bool equals(BibleBookIdsRecord? e1, BibleBookIdsRecord? e2) {
    return e1?.bibleId == e2?.bibleId && e1?.bibleBookName == e2?.bibleBookName;
  }

  @override
  int hash(BibleBookIdsRecord? e) =>
      const ListEquality().hash([e?.bibleId, e?.bibleBookName]);

  @override
  bool isValidKey(Object? o) => o is BibleBookIdsRecord;
}
