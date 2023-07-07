import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DiscipleshipRequestRecord extends FirestoreRecord {
  DiscipleshipRequestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "from" field.
  DocumentReference? _from;
  DocumentReference? get from => _from;
  bool hasFrom() => _from != null;

  // "to" field.
  DocumentReference? _to;
  DocumentReference? get to => _to;
  bool hasTo() => _to != null;

  // "approved" field.
  bool? _approved;
  bool get approved => _approved ?? false;
  bool hasApproved() => _approved != null;

  // "rejected" field.
  bool? _rejected;
  bool get rejected => _rejected ?? false;
  bool hasRejected() => _rejected != null;

  // "done" field.
  bool? _done;
  bool get done => _done ?? false;
  bool hasDone() => _done != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _from = snapshotData['from'] as DocumentReference?;
    _to = snapshotData['to'] as DocumentReference?;
    _approved = snapshotData['approved'] as bool?;
    _rejected = snapshotData['rejected'] as bool?;
    _done = snapshotData['done'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('discipleship_request');

  static Stream<DiscipleshipRequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DiscipleshipRequestRecord.fromSnapshot(s));

  static Future<DiscipleshipRequestRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DiscipleshipRequestRecord.fromSnapshot(s));

  static DiscipleshipRequestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DiscipleshipRequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DiscipleshipRequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DiscipleshipRequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DiscipleshipRequestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DiscipleshipRequestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDiscipleshipRequestRecordData({
  DateTime? date,
  DocumentReference? from,
  DocumentReference? to,
  bool? approved,
  bool? rejected,
  bool? done,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'from': from,
      'to': to,
      'approved': approved,
      'rejected': rejected,
      'done': done,
    }.withoutNulls,
  );

  return firestoreData;
}

class DiscipleshipRequestRecordDocumentEquality
    implements Equality<DiscipleshipRequestRecord> {
  const DiscipleshipRequestRecordDocumentEquality();

  @override
  bool equals(DiscipleshipRequestRecord? e1, DiscipleshipRequestRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.from == e2?.from &&
        e1?.to == e2?.to &&
        e1?.approved == e2?.approved &&
        e1?.rejected == e2?.rejected &&
        e1?.done == e2?.done;
  }

  @override
  int hash(DiscipleshipRequestRecord? e) => const ListEquality()
      .hash([e?.date, e?.from, e?.to, e?.approved, e?.rejected, e?.done]);

  @override
  bool isValidKey(Object? o) => o is DiscipleshipRequestRecord;
}
