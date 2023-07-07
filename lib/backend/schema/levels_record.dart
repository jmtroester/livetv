import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LevelsRecord extends FirestoreRecord {
  LevelsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "level_id" field.
  int? _levelId;
  int get levelId => _levelId ?? 0;
  bool hasLevelId() => _levelId != null;

  // "level_image" field.
  String? _levelImage;
  String get levelImage => _levelImage ?? '';
  bool hasLevelImage() => _levelImage != null;

  // "min_points" field.
  int? _minPoints;
  int get minPoints => _minPoints ?? 0;
  bool hasMinPoints() => _minPoints != null;

  // "max_points" field.
  int? _maxPoints;
  int get maxPoints => _maxPoints ?? 0;
  bool hasMaxPoints() => _maxPoints != null;

  // "user" field.
  List<DocumentReference>? _user;
  List<DocumentReference> get user => _user ?? const [];
  bool hasUser() => _user != null;

  void _initializeFields() {
    _levelId = castToType<int>(snapshotData['level_id']);
    _levelImage = snapshotData['level_image'] as String?;
    _minPoints = castToType<int>(snapshotData['min_points']);
    _maxPoints = castToType<int>(snapshotData['max_points']);
    _user = getDataList(snapshotData['user']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('levels');

  static Stream<LevelsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LevelsRecord.fromSnapshot(s));

  static Future<LevelsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LevelsRecord.fromSnapshot(s));

  static LevelsRecord fromSnapshot(DocumentSnapshot snapshot) => LevelsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LevelsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LevelsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LevelsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LevelsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLevelsRecordData({
  int? levelId,
  String? levelImage,
  int? minPoints,
  int? maxPoints,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'level_id': levelId,
      'level_image': levelImage,
      'min_points': minPoints,
      'max_points': maxPoints,
    }.withoutNulls,
  );

  return firestoreData;
}

class LevelsRecordDocumentEquality implements Equality<LevelsRecord> {
  const LevelsRecordDocumentEquality();

  @override
  bool equals(LevelsRecord? e1, LevelsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.levelId == e2?.levelId &&
        e1?.levelImage == e2?.levelImage &&
        e1?.minPoints == e2?.minPoints &&
        e1?.maxPoints == e2?.maxPoints &&
        listEquality.equals(e1?.user, e2?.user);
  }

  @override
  int hash(LevelsRecord? e) => const ListEquality()
      .hash([e?.levelId, e?.levelImage, e?.minPoints, e?.maxPoints, e?.user]);

  @override
  bool isValidKey(Object? o) => o is LevelsRecord;
}
