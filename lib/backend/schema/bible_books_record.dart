import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BibleBooksRecord extends FirestoreRecord {
  BibleBooksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "book_name" field.
  String? _bookName;
  String get bookName => _bookName ?? '';
  bool hasBookName() => _bookName != null;

  // "chapter_no" field.
  List<int>? _chapterNo;
  List<int> get chapterNo => _chapterNo ?? const [];
  bool hasChapterNo() => _chapterNo != null;

  // "verse_no" field.
  List<int>? _verseNo;
  List<int> get verseNo => _verseNo ?? const [];
  bool hasVerseNo() => _verseNo != null;

  void _initializeFields() {
    _bookName = snapshotData['book_name'] as String?;
    _chapterNo = getDataList(snapshotData['chapter_no']);
    _verseNo = getDataList(snapshotData['verse_no']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bible_books');

  static Stream<BibleBooksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BibleBooksRecord.fromSnapshot(s));

  static Future<BibleBooksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BibleBooksRecord.fromSnapshot(s));

  static BibleBooksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BibleBooksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BibleBooksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BibleBooksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BibleBooksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BibleBooksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBibleBooksRecordData({
  String? bookName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'book_name': bookName,
    }.withoutNulls,
  );

  return firestoreData;
}

class BibleBooksRecordDocumentEquality implements Equality<BibleBooksRecord> {
  const BibleBooksRecordDocumentEquality();

  @override
  bool equals(BibleBooksRecord? e1, BibleBooksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.bookName == e2?.bookName &&
        listEquality.equals(e1?.chapterNo, e2?.chapterNo) &&
        listEquality.equals(e1?.verseNo, e2?.verseNo);
  }

  @override
  int hash(BibleBooksRecord? e) =>
      const ListEquality().hash([e?.bookName, e?.chapterNo, e?.verseNo]);

  @override
  bool isValidKey(Object? o) => o is BibleBooksRecord;
}
