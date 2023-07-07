import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DiscipleshipReportRecord extends FirestoreRecord {
  DiscipleshipReportRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "time_submitted" field.
  DateTime? _timeSubmitted;
  DateTime? get timeSubmitted => _timeSubmitted;
  bool hasTimeSubmitted() => _timeSubmitted != null;

  // "time_submitted_string" field.
  String? _timeSubmittedString;
  String get timeSubmittedString => _timeSubmittedString ?? '';
  bool hasTimeSubmittedString() => _timeSubmittedString != null;

  // "linked_prayer" field.
  DocumentReference? _linkedPrayer;
  DocumentReference? get linkedPrayer => _linkedPrayer;
  bool hasLinkedPrayer() => _linkedPrayer != null;

  // "physically" field.
  double? _physically;
  double get physically => _physically ?? 0.0;
  bool hasPhysically() => _physically != null;

  // "mentally" field.
  double? _mentally;
  double get mentally => _mentally ?? 0.0;
  bool hasMentally() => _mentally != null;

  // "spiritually" field.
  double? _spiritually;
  double get spiritually => _spiritually ?? 0.0;
  bool hasSpiritually() => _spiritually != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _timeSubmitted = snapshotData['time_submitted'] as DateTime?;
    _timeSubmittedString = snapshotData['time_submitted_string'] as String?;
    _linkedPrayer = snapshotData['linked_prayer'] as DocumentReference?;
    _physically = castToType<double>(snapshotData['physically']);
    _mentally = castToType<double>(snapshotData['mentally']);
    _spiritually = castToType<double>(snapshotData['spiritually']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('discipleship_report');

  static Stream<DiscipleshipReportRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DiscipleshipReportRecord.fromSnapshot(s));

  static Future<DiscipleshipReportRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DiscipleshipReportRecord.fromSnapshot(s));

  static DiscipleshipReportRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DiscipleshipReportRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DiscipleshipReportRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DiscipleshipReportRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DiscipleshipReportRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DiscipleshipReportRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDiscipleshipReportRecordData({
  DocumentReference? user,
  DateTime? timeSubmitted,
  String? timeSubmittedString,
  DocumentReference? linkedPrayer,
  double? physically,
  double? mentally,
  double? spiritually,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'time_submitted': timeSubmitted,
      'time_submitted_string': timeSubmittedString,
      'linked_prayer': linkedPrayer,
      'physically': physically,
      'mentally': mentally,
      'spiritually': spiritually,
    }.withoutNulls,
  );

  return firestoreData;
}

class DiscipleshipReportRecordDocumentEquality
    implements Equality<DiscipleshipReportRecord> {
  const DiscipleshipReportRecordDocumentEquality();

  @override
  bool equals(DiscipleshipReportRecord? e1, DiscipleshipReportRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.timeSubmitted == e2?.timeSubmitted &&
        e1?.timeSubmittedString == e2?.timeSubmittedString &&
        e1?.linkedPrayer == e2?.linkedPrayer &&
        e1?.physically == e2?.physically &&
        e1?.mentally == e2?.mentally &&
        e1?.spiritually == e2?.spiritually;
  }

  @override
  int hash(DiscipleshipReportRecord? e) => const ListEquality().hash([
        e?.user,
        e?.timeSubmitted,
        e?.timeSubmittedString,
        e?.linkedPrayer,
        e?.physically,
        e?.mentally,
        e?.spiritually
      ]);

  @override
  bool isValidKey(Object? o) => o is DiscipleshipReportRecord;
}
