import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BibleStudyNotesRecord extends FirestoreRecord {
  BibleStudyNotesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "verse_reference" field.
  String? _verseReference;
  String get verseReference => _verseReference ?? '';
  bool hasVerseReference() => _verseReference != null;

  // "verse_text" field.
  String? _verseText;
  String get verseText => _verseText ?? '';
  bool hasVerseText() => _verseText != null;

  // "book_info" field.
  String? _bookInfo;
  String get bookInfo => _bookInfo ?? '';
  bool hasBookInfo() => _bookInfo != null;

  // "key_words" field.
  List<String>? _keyWords;
  List<String> get keyWords => _keyWords ?? const [];
  bool hasKeyWords() => _keyWords != null;

  // "cross_references" field.
  List<String>? _crossReferences;
  List<String> get crossReferences => _crossReferences ?? const [];
  bool hasCrossReferences() => _crossReferences != null;

  // "question_responses_1" field.
  String? _questionResponses1;
  String get questionResponses1 => _questionResponses1 ?? '';
  bool hasQuestionResponses1() => _questionResponses1 != null;

  // "question_responses_2" field.
  String? _questionResponses2;
  String get questionResponses2 => _questionResponses2 ?? '';
  bool hasQuestionResponses2() => _questionResponses2 != null;

  // "question_responses_3" field.
  String? _questionResponses3;
  String get questionResponses3 => _questionResponses3 ?? '';
  bool hasQuestionResponses3() => _questionResponses3 != null;

  // "question_responses_4" field.
  String? _questionResponses4;
  String get questionResponses4 => _questionResponses4 ?? '';
  bool hasQuestionResponses4() => _questionResponses4 != null;

  // "question_responses_5" field.
  String? _questionResponses5;
  String get questionResponses5 => _questionResponses5 ?? '';
  bool hasQuestionResponses5() => _questionResponses5 != null;

  // "question_responses_6" field.
  String? _questionResponses6;
  String get questionResponses6 => _questionResponses6 ?? '';
  bool hasQuestionResponses6() => _questionResponses6 != null;

  // "note_id" field.
  int? _noteId;
  int get noteId => _noteId ?? 0;
  bool hasNoteId() => _noteId != null;

  // "is_public" field.
  bool? _isPublic;
  bool get isPublic => _isPublic ?? false;
  bool hasIsPublic() => _isPublic != null;

  // "permission_to_view_note" field.
  List<DocumentReference>? _permissionToViewNote;
  List<DocumentReference> get permissionToViewNote =>
      _permissionToViewNote ?? const [];
  bool hasPermissionToViewNote() => _permissionToViewNote != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _verseReference = snapshotData['verse_reference'] as String?;
    _verseText = snapshotData['verse_text'] as String?;
    _bookInfo = snapshotData['book_info'] as String?;
    _keyWords = getDataList(snapshotData['key_words']);
    _crossReferences = getDataList(snapshotData['cross_references']);
    _questionResponses1 = snapshotData['question_responses_1'] as String?;
    _questionResponses2 = snapshotData['question_responses_2'] as String?;
    _questionResponses3 = snapshotData['question_responses_3'] as String?;
    _questionResponses4 = snapshotData['question_responses_4'] as String?;
    _questionResponses5 = snapshotData['question_responses_5'] as String?;
    _questionResponses6 = snapshotData['question_responses_6'] as String?;
    _noteId = castToType<int>(snapshotData['note_id']);
    _isPublic = snapshotData['is_public'] as bool?;
    _permissionToViewNote =
        getDataList(snapshotData['permission_to_view_note']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bible_study_notes');

  static Stream<BibleStudyNotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BibleStudyNotesRecord.fromSnapshot(s));

  static Future<BibleStudyNotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BibleStudyNotesRecord.fromSnapshot(s));

  static BibleStudyNotesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BibleStudyNotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BibleStudyNotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BibleStudyNotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BibleStudyNotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BibleStudyNotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBibleStudyNotesRecordData({
  DocumentReference? user,
  String? verseReference,
  String? verseText,
  String? bookInfo,
  String? questionResponses1,
  String? questionResponses2,
  String? questionResponses3,
  String? questionResponses4,
  String? questionResponses5,
  String? questionResponses6,
  int? noteId,
  bool? isPublic,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'verse_reference': verseReference,
      'verse_text': verseText,
      'book_info': bookInfo,
      'question_responses_1': questionResponses1,
      'question_responses_2': questionResponses2,
      'question_responses_3': questionResponses3,
      'question_responses_4': questionResponses4,
      'question_responses_5': questionResponses5,
      'question_responses_6': questionResponses6,
      'note_id': noteId,
      'is_public': isPublic,
    }.withoutNulls,
  );

  return firestoreData;
}

class BibleStudyNotesRecordDocumentEquality
    implements Equality<BibleStudyNotesRecord> {
  const BibleStudyNotesRecordDocumentEquality();

  @override
  bool equals(BibleStudyNotesRecord? e1, BibleStudyNotesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        e1?.verseReference == e2?.verseReference &&
        e1?.verseText == e2?.verseText &&
        e1?.bookInfo == e2?.bookInfo &&
        listEquality.equals(e1?.keyWords, e2?.keyWords) &&
        listEquality.equals(e1?.crossReferences, e2?.crossReferences) &&
        e1?.questionResponses1 == e2?.questionResponses1 &&
        e1?.questionResponses2 == e2?.questionResponses2 &&
        e1?.questionResponses3 == e2?.questionResponses3 &&
        e1?.questionResponses4 == e2?.questionResponses4 &&
        e1?.questionResponses5 == e2?.questionResponses5 &&
        e1?.questionResponses6 == e2?.questionResponses6 &&
        e1?.noteId == e2?.noteId &&
        e1?.isPublic == e2?.isPublic &&
        listEquality.equals(e1?.permissionToViewNote, e2?.permissionToViewNote);
  }

  @override
  int hash(BibleStudyNotesRecord? e) => const ListEquality().hash([
        e?.user,
        e?.verseReference,
        e?.verseText,
        e?.bookInfo,
        e?.keyWords,
        e?.crossReferences,
        e?.questionResponses1,
        e?.questionResponses2,
        e?.questionResponses3,
        e?.questionResponses4,
        e?.questionResponses5,
        e?.questionResponses6,
        e?.noteId,
        e?.isPublic,
        e?.permissionToViewNote
      ]);

  @override
  bool isValidKey(Object? o) => o is BibleStudyNotesRecord;
}
