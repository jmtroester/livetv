import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DiscipleshipHelpRecord extends FirestoreRecord {
  DiscipleshipHelpRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "date_started" field.
  DateTime? _dateStarted;
  DateTime? get dateStarted => _dateStarted;
  bool hasDateStarted() => _dateStarted != null;

  // "date_started_string" field.
  String? _dateStartedString;
  String get dateStartedString => _dateStartedString ?? '';
  bool hasDateStartedString() => _dateStartedString != null;

  // "date_completed" field.
  DateTime? _dateCompleted;
  DateTime? get dateCompleted => _dateCompleted;
  bool hasDateCompleted() => _dateCompleted != null;

  // "date_completed_string" field.
  String? _dateCompletedString;
  String get dateCompletedString => _dateCompletedString ?? '';
  bool hasDateCompletedString() => _dateCompletedString != null;

  // "help_type" field.
  String? _helpType;
  String get helpType => _helpType ?? '';
  bool hasHelpType() => _helpType != null;

  // "item_1" field.
  bool? _item1;
  bool get item1 => _item1 ?? false;
  bool hasItem1() => _item1 != null;

  // "item_2" field.
  bool? _item2;
  bool get item2 => _item2 ?? false;
  bool hasItem2() => _item2 != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  bool hasCompleted() => _completed != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _dateStarted = snapshotData['date_started'] as DateTime?;
    _dateStartedString = snapshotData['date_started_string'] as String?;
    _dateCompleted = snapshotData['date_completed'] as DateTime?;
    _dateCompletedString = snapshotData['date_completed_string'] as String?;
    _helpType = snapshotData['help_type'] as String?;
    _item1 = snapshotData['item_1'] as bool?;
    _item2 = snapshotData['item_2'] as bool?;
    _completed = snapshotData['completed'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('discipleship_help');

  static Stream<DiscipleshipHelpRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DiscipleshipHelpRecord.fromSnapshot(s));

  static Future<DiscipleshipHelpRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DiscipleshipHelpRecord.fromSnapshot(s));

  static DiscipleshipHelpRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DiscipleshipHelpRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DiscipleshipHelpRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DiscipleshipHelpRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DiscipleshipHelpRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DiscipleshipHelpRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDiscipleshipHelpRecordData({
  DocumentReference? user,
  DateTime? dateStarted,
  String? dateStartedString,
  DateTime? dateCompleted,
  String? dateCompletedString,
  String? helpType,
  bool? item1,
  bool? item2,
  bool? completed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'date_started': dateStarted,
      'date_started_string': dateStartedString,
      'date_completed': dateCompleted,
      'date_completed_string': dateCompletedString,
      'help_type': helpType,
      'item_1': item1,
      'item_2': item2,
      'completed': completed,
    }.withoutNulls,
  );

  return firestoreData;
}

class DiscipleshipHelpRecordDocumentEquality
    implements Equality<DiscipleshipHelpRecord> {
  const DiscipleshipHelpRecordDocumentEquality();

  @override
  bool equals(DiscipleshipHelpRecord? e1, DiscipleshipHelpRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.dateStarted == e2?.dateStarted &&
        e1?.dateStartedString == e2?.dateStartedString &&
        e1?.dateCompleted == e2?.dateCompleted &&
        e1?.dateCompletedString == e2?.dateCompletedString &&
        e1?.helpType == e2?.helpType &&
        e1?.item1 == e2?.item1 &&
        e1?.item2 == e2?.item2 &&
        e1?.completed == e2?.completed;
  }

  @override
  int hash(DiscipleshipHelpRecord? e) => const ListEquality().hash([
        e?.user,
        e?.dateStarted,
        e?.dateStartedString,
        e?.dateCompleted,
        e?.dateCompletedString,
        e?.helpType,
        e?.item1,
        e?.item2,
        e?.completed
      ]);

  @override
  bool isValidKey(Object? o) => o is DiscipleshipHelpRecord;
}
