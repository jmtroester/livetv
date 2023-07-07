import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DevosRecord extends FirestoreRecord {
  DevosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "verse_reference" field.
  String? _verseReference;
  String get verseReference => _verseReference ?? '';
  bool hasVerseReference() => _verseReference != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "date_string" field.
  String? _dateString;
  String get dateString => _dateString ?? '';
  bool hasDateString() => _dateString != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "catechism_title" field.
  String? _catechismTitle;
  String get catechismTitle => _catechismTitle ?? '';
  bool hasCatechismTitle() => _catechismTitle != null;

  // "catechism_details" field.
  String? _catechismDetails;
  String get catechismDetails => _catechismDetails ?? '';
  bool hasCatechismDetails() => _catechismDetails != null;

  // "prayer_topic" field.
  String? _prayerTopic;
  String get prayerTopic => _prayerTopic ?? '';
  bool hasPrayerTopic() => _prayerTopic != null;

  // "prayer_details" field.
  String? _prayerDetails;
  String get prayerDetails => _prayerDetails ?? '';
  bool hasPrayerDetails() => _prayerDetails != null;

  // "possible_question_1" field.
  String? _possibleQuestion1;
  String get possibleQuestion1 => _possibleQuestion1 ?? '';
  bool hasPossibleQuestion1() => _possibleQuestion1 != null;

  // "possible_question_2" field.
  String? _possibleQuestion2;
  String get possibleQuestion2 => _possibleQuestion2 ?? '';
  bool hasPossibleQuestion2() => _possibleQuestion2 != null;

  // "book" field.
  String? _book;
  String get book => _book ?? '';
  bool hasBook() => _book != null;

  // "chapter_no" field.
  String? _chapterNo;
  String get chapterNo => _chapterNo ?? '';
  bool hasChapterNo() => _chapterNo != null;

  // "verse_no" field.
  String? _verseNo;
  String get verseNo => _verseNo ?? '';
  bool hasVerseNo() => _verseNo != null;

  void _initializeFields() {
    _verseReference = snapshotData['verse_reference'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _dateString = snapshotData['date_string'] as String?;
    _photo = snapshotData['photo'] as String?;
    _catechismTitle = snapshotData['catechism_title'] as String?;
    _catechismDetails = snapshotData['catechism_details'] as String?;
    _prayerTopic = snapshotData['prayer_topic'] as String?;
    _prayerDetails = snapshotData['prayer_details'] as String?;
    _possibleQuestion1 = snapshotData['possible_question_1'] as String?;
    _possibleQuestion2 = snapshotData['possible_question_2'] as String?;
    _book = snapshotData['book'] as String?;
    _chapterNo = snapshotData['chapter_no'] as String?;
    _verseNo = snapshotData['verse_no'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('devos');

  static Stream<DevosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DevosRecord.fromSnapshot(s));

  static Future<DevosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DevosRecord.fromSnapshot(s));

  static DevosRecord fromSnapshot(DocumentSnapshot snapshot) => DevosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DevosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DevosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DevosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DevosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDevosRecordData({
  String? verseReference,
  DateTime? date,
  String? dateString,
  String? photo,
  String? catechismTitle,
  String? catechismDetails,
  String? prayerTopic,
  String? prayerDetails,
  String? possibleQuestion1,
  String? possibleQuestion2,
  String? book,
  String? chapterNo,
  String? verseNo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'verse_reference': verseReference,
      'date': date,
      'date_string': dateString,
      'photo': photo,
      'catechism_title': catechismTitle,
      'catechism_details': catechismDetails,
      'prayer_topic': prayerTopic,
      'prayer_details': prayerDetails,
      'possible_question_1': possibleQuestion1,
      'possible_question_2': possibleQuestion2,
      'book': book,
      'chapter_no': chapterNo,
      'verse_no': verseNo,
    }.withoutNulls,
  );

  return firestoreData;
}

class DevosRecordDocumentEquality implements Equality<DevosRecord> {
  const DevosRecordDocumentEquality();

  @override
  bool equals(DevosRecord? e1, DevosRecord? e2) {
    return e1?.verseReference == e2?.verseReference &&
        e1?.date == e2?.date &&
        e1?.dateString == e2?.dateString &&
        e1?.photo == e2?.photo &&
        e1?.catechismTitle == e2?.catechismTitle &&
        e1?.catechismDetails == e2?.catechismDetails &&
        e1?.prayerTopic == e2?.prayerTopic &&
        e1?.prayerDetails == e2?.prayerDetails &&
        e1?.possibleQuestion1 == e2?.possibleQuestion1 &&
        e1?.possibleQuestion2 == e2?.possibleQuestion2 &&
        e1?.book == e2?.book &&
        e1?.chapterNo == e2?.chapterNo &&
        e1?.verseNo == e2?.verseNo;
  }

  @override
  int hash(DevosRecord? e) => const ListEquality().hash([
        e?.verseReference,
        e?.date,
        e?.dateString,
        e?.photo,
        e?.catechismTitle,
        e?.catechismDetails,
        e?.prayerTopic,
        e?.prayerDetails,
        e?.possibleQuestion1,
        e?.possibleQuestion2,
        e?.book,
        e?.chapterNo,
        e?.verseNo
      ]);

  @override
  bool isValidKey(Object? o) => o is DevosRecord;
}
