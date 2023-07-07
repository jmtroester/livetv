import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JournalEntriesRecord extends FirestoreRecord {
  JournalEntriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "journal_date" field.
  DateTime? _journalDate;
  DateTime? get journalDate => _journalDate;
  bool hasJournalDate() => _journalDate != null;

  // "journal_entry" field.
  String? _journalEntry;
  String get journalEntry => _journalEntry ?? '';
  bool hasJournalEntry() => _journalEntry != null;

  // "journal_verse" field.
  String? _journalVerse;
  String get journalVerse => _journalVerse ?? '';
  bool hasJournalVerse() => _journalVerse != null;

  // "journal_writer" field.
  DocumentReference? _journalWriter;
  DocumentReference? get journalWriter => _journalWriter;
  bool hasJournalWriter() => _journalWriter != null;

  // "journal_date_string" field.
  String? _journalDateString;
  String get journalDateString => _journalDateString ?? '';
  bool hasJournalDateString() => _journalDateString != null;

  void _initializeFields() {
    _journalDate = snapshotData['journal_date'] as DateTime?;
    _journalEntry = snapshotData['journal_entry'] as String?;
    _journalVerse = snapshotData['journal_verse'] as String?;
    _journalWriter = snapshotData['journal_writer'] as DocumentReference?;
    _journalDateString = snapshotData['journal_date_string'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('journal_entries');

  static Stream<JournalEntriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JournalEntriesRecord.fromSnapshot(s));

  static Future<JournalEntriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JournalEntriesRecord.fromSnapshot(s));

  static JournalEntriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      JournalEntriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JournalEntriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JournalEntriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JournalEntriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JournalEntriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJournalEntriesRecordData({
  DateTime? journalDate,
  String? journalEntry,
  String? journalVerse,
  DocumentReference? journalWriter,
  String? journalDateString,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'journal_date': journalDate,
      'journal_entry': journalEntry,
      'journal_verse': journalVerse,
      'journal_writer': journalWriter,
      'journal_date_string': journalDateString,
    }.withoutNulls,
  );

  return firestoreData;
}

class JournalEntriesRecordDocumentEquality
    implements Equality<JournalEntriesRecord> {
  const JournalEntriesRecordDocumentEquality();

  @override
  bool equals(JournalEntriesRecord? e1, JournalEntriesRecord? e2) {
    return e1?.journalDate == e2?.journalDate &&
        e1?.journalEntry == e2?.journalEntry &&
        e1?.journalVerse == e2?.journalVerse &&
        e1?.journalWriter == e2?.journalWriter &&
        e1?.journalDateString == e2?.journalDateString;
  }

  @override
  int hash(JournalEntriesRecord? e) => const ListEquality().hash([
        e?.journalDate,
        e?.journalEntry,
        e?.journalVerse,
        e?.journalWriter,
        e?.journalDateString
      ]);

  @override
  bool isValidKey(Object? o) => o is JournalEntriesRecord;
}
