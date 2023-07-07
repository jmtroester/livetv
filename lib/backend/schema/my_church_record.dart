import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyChurchRecord extends FirestoreRecord {
  MyChurchRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "church_name" field.
  String? _churchName;
  String get churchName => _churchName ?? '';
  bool hasChurchName() => _churchName != null;

  // "church_street_address" field.
  String? _churchStreetAddress;
  String get churchStreetAddress => _churchStreetAddress ?? '';
  bool hasChurchStreetAddress() => _churchStreetAddress != null;

  // "church_state" field.
  String? _churchState;
  String get churchState => _churchState ?? '';
  bool hasChurchState() => _churchState != null;

  // "church_zip" field.
  String? _churchZip;
  String get churchZip => _churchZip ?? '';
  bool hasChurchZip() => _churchZip != null;

  void _initializeFields() {
    _churchName = snapshotData['church_name'] as String?;
    _churchStreetAddress = snapshotData['church_street_address'] as String?;
    _churchState = snapshotData['church_state'] as String?;
    _churchZip = snapshotData['church_zip'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('my_church');

  static Stream<MyChurchRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyChurchRecord.fromSnapshot(s));

  static Future<MyChurchRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyChurchRecord.fromSnapshot(s));

  static MyChurchRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MyChurchRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyChurchRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyChurchRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyChurchRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyChurchRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyChurchRecordData({
  String? churchName,
  String? churchStreetAddress,
  String? churchState,
  String? churchZip,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'church_name': churchName,
      'church_street_address': churchStreetAddress,
      'church_state': churchState,
      'church_zip': churchZip,
    }.withoutNulls,
  );

  return firestoreData;
}

class MyChurchRecordDocumentEquality implements Equality<MyChurchRecord> {
  const MyChurchRecordDocumentEquality();

  @override
  bool equals(MyChurchRecord? e1, MyChurchRecord? e2) {
    return e1?.churchName == e2?.churchName &&
        e1?.churchStreetAddress == e2?.churchStreetAddress &&
        e1?.churchState == e2?.churchState &&
        e1?.churchZip == e2?.churchZip;
  }

  @override
  int hash(MyChurchRecord? e) => const ListEquality().hash(
      [e?.churchName, e?.churchStreetAddress, e?.churchState, e?.churchZip]);

  @override
  bool isValidKey(Object? o) => o is MyChurchRecord;
}
