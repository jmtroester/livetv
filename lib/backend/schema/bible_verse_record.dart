import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BibleVerseRecord extends FirestoreRecord {
  BibleVerseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "verse_no" field.
  String? _verseNo;
  String get verseNo => _verseNo ?? '';
  bool hasVerseNo() => _verseNo != null;

  // "chapter_no" field.
  DocumentReference? _chapterNo;
  DocumentReference? get chapterNo => _chapterNo;
  bool hasChapterNo() => _chapterNo != null;

  // "book_name" field.
  DocumentReference? _bookName;
  DocumentReference? get bookName => _bookName;
  bool hasBookName() => _bookName != null;

  void _initializeFields() {
    _verseNo = snapshotData['verse_no'] as String?;
    _chapterNo = snapshotData['chapter_no'] as DocumentReference?;
    _bookName = snapshotData['book_name'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bible_verse');

  static Stream<BibleVerseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BibleVerseRecord.fromSnapshot(s));

  static Future<BibleVerseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BibleVerseRecord.fromSnapshot(s));

  static BibleVerseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BibleVerseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BibleVerseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BibleVerseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BibleVerseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BibleVerseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBibleVerseRecordData({
  String? verseNo,
  DocumentReference? chapterNo,
  DocumentReference? bookName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'verse_no': verseNo,
      'chapter_no': chapterNo,
      'book_name': bookName,
    }.withoutNulls,
  );

  return firestoreData;
}

class BibleVerseRecordDocumentEquality implements Equality<BibleVerseRecord> {
  const BibleVerseRecordDocumentEquality();

  @override
  bool equals(BibleVerseRecord? e1, BibleVerseRecord? e2) {
    return e1?.verseNo == e2?.verseNo &&
        e1?.chapterNo == e2?.chapterNo &&
        e1?.bookName == e2?.bookName;
  }

  @override
  int hash(BibleVerseRecord? e) =>
      const ListEquality().hash([e?.verseNo, e?.chapterNo, e?.bookName]);

  @override
  bool isValidKey(Object? o) => o is BibleVerseRecord;
}
