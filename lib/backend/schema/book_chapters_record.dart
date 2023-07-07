import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookChaptersRecord extends FirestoreRecord {
  BookChaptersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "chapter_no" field.
  String? _chapterNo;
  String get chapterNo => _chapterNo ?? '';
  bool hasChapterNo() => _chapterNo != null;

  // "book_name" field.
  DocumentReference? _bookName;
  DocumentReference? get bookName => _bookName;
  bool hasBookName() => _bookName != null;

  void _initializeFields() {
    _chapterNo = snapshotData['chapter_no'] as String?;
    _bookName = snapshotData['book_name'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('book_chapters');

  static Stream<BookChaptersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookChaptersRecord.fromSnapshot(s));

  static Future<BookChaptersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookChaptersRecord.fromSnapshot(s));

  static BookChaptersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookChaptersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookChaptersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookChaptersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookChaptersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookChaptersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookChaptersRecordData({
  String? chapterNo,
  DocumentReference? bookName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chapter_no': chapterNo,
      'book_name': bookName,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookChaptersRecordDocumentEquality
    implements Equality<BookChaptersRecord> {
  const BookChaptersRecordDocumentEquality();

  @override
  bool equals(BookChaptersRecord? e1, BookChaptersRecord? e2) {
    return e1?.chapterNo == e2?.chapterNo && e1?.bookName == e2?.bookName;
  }

  @override
  int hash(BookChaptersRecord? e) =>
      const ListEquality().hash([e?.chapterNo, e?.bookName]);

  @override
  bool isValidKey(Object? o) => o is BookChaptersRecord;
}
