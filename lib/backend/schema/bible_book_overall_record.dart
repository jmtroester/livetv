import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BibleBookOverallRecord extends FirestoreRecord {
  BibleBookOverallRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "book_name" field.
  String? _bookName;
  String get bookName => _bookName ?? '';
  bool hasBookName() => _bookName != null;

  // "book_summary" field.
  String? _bookSummary;
  String get bookSummary => _bookSummary ?? '';
  bool hasBookSummary() => _bookSummary != null;

  // "book_author" field.
  String? _bookAuthor;
  String get bookAuthor => _bookAuthor ?? '';
  bool hasBookAuthor() => _bookAuthor != null;

  // "book_time_written" field.
  String? _bookTimeWritten;
  String get bookTimeWritten => _bookTimeWritten ?? '';
  bool hasBookTimeWritten() => _bookTimeWritten != null;

  // "book_id" field.
  int? _bookId;
  int get bookId => _bookId ?? 0;
  bool hasBookId() => _bookId != null;

  // "book_time_covered" field.
  String? _bookTimeCovered;
  String get bookTimeCovered => _bookTimeCovered ?? '';
  bool hasBookTimeCovered() => _bookTimeCovered != null;

  // "lexicon_prefix" field.
  String? _lexiconPrefix;
  String get lexiconPrefix => _lexiconPrefix ?? '';
  bool hasLexiconPrefix() => _lexiconPrefix != null;

  void _initializeFields() {
    _bookName = snapshotData['book_name'] as String?;
    _bookSummary = snapshotData['book_summary'] as String?;
    _bookAuthor = snapshotData['book_author'] as String?;
    _bookTimeWritten = snapshotData['book_time_written'] as String?;
    _bookId = castToType<int>(snapshotData['book_id']);
    _bookTimeCovered = snapshotData['book_time_covered'] as String?;
    _lexiconPrefix = snapshotData['lexicon_prefix'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bible_book_overall');

  static Stream<BibleBookOverallRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BibleBookOverallRecord.fromSnapshot(s));

  static Future<BibleBookOverallRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BibleBookOverallRecord.fromSnapshot(s));

  static BibleBookOverallRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BibleBookOverallRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BibleBookOverallRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BibleBookOverallRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BibleBookOverallRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BibleBookOverallRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBibleBookOverallRecordData({
  String? bookName,
  String? bookSummary,
  String? bookAuthor,
  String? bookTimeWritten,
  int? bookId,
  String? bookTimeCovered,
  String? lexiconPrefix,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'book_name': bookName,
      'book_summary': bookSummary,
      'book_author': bookAuthor,
      'book_time_written': bookTimeWritten,
      'book_id': bookId,
      'book_time_covered': bookTimeCovered,
      'lexicon_prefix': lexiconPrefix,
    }.withoutNulls,
  );

  return firestoreData;
}

class BibleBookOverallRecordDocumentEquality
    implements Equality<BibleBookOverallRecord> {
  const BibleBookOverallRecordDocumentEquality();

  @override
  bool equals(BibleBookOverallRecord? e1, BibleBookOverallRecord? e2) {
    return e1?.bookName == e2?.bookName &&
        e1?.bookSummary == e2?.bookSummary &&
        e1?.bookAuthor == e2?.bookAuthor &&
        e1?.bookTimeWritten == e2?.bookTimeWritten &&
        e1?.bookId == e2?.bookId &&
        e1?.bookTimeCovered == e2?.bookTimeCovered &&
        e1?.lexiconPrefix == e2?.lexiconPrefix;
  }

  @override
  int hash(BibleBookOverallRecord? e) => const ListEquality().hash([
        e?.bookName,
        e?.bookSummary,
        e?.bookAuthor,
        e?.bookTimeWritten,
        e?.bookId,
        e?.bookTimeCovered,
        e?.lexiconPrefix
      ]);

  @override
  bool isValidKey(Object? o) => o is BibleBookOverallRecord;
}
