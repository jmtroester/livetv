import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrayersRecord extends FirestoreRecord {
  PrayersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "prayer" field.
  String? _prayer;
  String get prayer => _prayer ?? '';
  bool hasPrayer() => _prayer != null;

  // "is_public" field.
  bool? _isPublic;
  bool get isPublic => _isPublic ?? false;
  bool hasIsPublic() => _isPublic != null;

  // "time_submitted" field.
  DateTime? _timeSubmitted;
  DateTime? get timeSubmitted => _timeSubmitted;
  bool hasTimeSubmitted() => _timeSubmitted != null;

  // "time_submitted_string" field.
  String? _timeSubmittedString;
  String get timeSubmittedString => _timeSubmittedString ?? '';
  bool hasTimeSubmittedString() => _timeSubmittedString != null;

  // "linked_report" field.
  DocumentReference? _linkedReport;
  DocumentReference? get linkedReport => _linkedReport;
  bool hasLinkedReport() => _linkedReport != null;

  // "likes_count" field.
  int? _likesCount;
  int get likesCount => _likesCount ?? 0;
  bool hasLikesCount() => _likesCount != null;

  // "liked_by" field.
  List<DocumentReference>? _likedBy;
  List<DocumentReference> get likedBy => _likedBy ?? const [];
  bool hasLikedBy() => _likedBy != null;

  // "prayed_count" field.
  int? _prayedCount;
  int get prayedCount => _prayedCount ?? 0;
  bool hasPrayedCount() => _prayedCount != null;

  // "prayed_for_by" field.
  List<DocumentReference>? _prayedForBy;
  List<DocumentReference> get prayedForBy => _prayedForBy ?? const [];
  bool hasPrayedForBy() => _prayedForBy != null;

  // "user_display_name" field.
  String? _userDisplayName;
  String get userDisplayName => _userDisplayName ?? '';
  bool hasUserDisplayName() => _userDisplayName != null;

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

  // "expiration" field.
  DateTime? _expiration;
  DateTime? get expiration => _expiration;
  bool hasExpiration() => _expiration != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _prayer = snapshotData['prayer'] as String?;
    _isPublic = snapshotData['is_public'] as bool?;
    _timeSubmitted = snapshotData['time_submitted'] as DateTime?;
    _timeSubmittedString = snapshotData['time_submitted_string'] as String?;
    _linkedReport = snapshotData['linked_report'] as DocumentReference?;
    _likesCount = castToType<int>(snapshotData['likes_count']);
    _likedBy = getDataList(snapshotData['liked_by']);
    _prayedCount = castToType<int>(snapshotData['prayed_count']);
    _prayedForBy = getDataList(snapshotData['prayed_for_by']);
    _userDisplayName = snapshotData['user_display_name'] as String?;
    _physically = castToType<double>(snapshotData['physically']);
    _mentally = castToType<double>(snapshotData['mentally']);
    _spiritually = castToType<double>(snapshotData['spiritually']);
    _expiration = snapshotData['expiration'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('prayers');

  static Stream<PrayersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PrayersRecord.fromSnapshot(s));

  static Future<PrayersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PrayersRecord.fromSnapshot(s));

  static PrayersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PrayersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PrayersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PrayersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PrayersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PrayersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPrayersRecordData({
  DocumentReference? user,
  String? prayer,
  bool? isPublic,
  DateTime? timeSubmitted,
  String? timeSubmittedString,
  DocumentReference? linkedReport,
  int? likesCount,
  int? prayedCount,
  String? userDisplayName,
  double? physically,
  double? mentally,
  double? spiritually,
  DateTime? expiration,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'prayer': prayer,
      'is_public': isPublic,
      'time_submitted': timeSubmitted,
      'time_submitted_string': timeSubmittedString,
      'linked_report': linkedReport,
      'likes_count': likesCount,
      'prayed_count': prayedCount,
      'user_display_name': userDisplayName,
      'physically': physically,
      'mentally': mentally,
      'spiritually': spiritually,
      'expiration': expiration,
    }.withoutNulls,
  );

  return firestoreData;
}

class PrayersRecordDocumentEquality implements Equality<PrayersRecord> {
  const PrayersRecordDocumentEquality();

  @override
  bool equals(PrayersRecord? e1, PrayersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        e1?.prayer == e2?.prayer &&
        e1?.isPublic == e2?.isPublic &&
        e1?.timeSubmitted == e2?.timeSubmitted &&
        e1?.timeSubmittedString == e2?.timeSubmittedString &&
        e1?.linkedReport == e2?.linkedReport &&
        e1?.likesCount == e2?.likesCount &&
        listEquality.equals(e1?.likedBy, e2?.likedBy) &&
        e1?.prayedCount == e2?.prayedCount &&
        listEquality.equals(e1?.prayedForBy, e2?.prayedForBy) &&
        e1?.userDisplayName == e2?.userDisplayName &&
        e1?.physically == e2?.physically &&
        e1?.mentally == e2?.mentally &&
        e1?.spiritually == e2?.spiritually &&
        e1?.expiration == e2?.expiration;
  }

  @override
  int hash(PrayersRecord? e) => const ListEquality().hash([
        e?.user,
        e?.prayer,
        e?.isPublic,
        e?.timeSubmitted,
        e?.timeSubmittedString,
        e?.linkedReport,
        e?.likesCount,
        e?.likedBy,
        e?.prayedCount,
        e?.prayedForBy,
        e?.userDisplayName,
        e?.physically,
        e?.mentally,
        e?.spiritually,
        e?.expiration
      ]);

  @override
  bool isValidKey(Object? o) => o is PrayersRecord;
}
