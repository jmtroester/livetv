import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivityLogRecord extends FirestoreRecord {
  ActivityLogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "activity" field.
  String? _activity;
  String get activity => _activity ?? '';
  bool hasActivity() => _activity != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "user" field.
  String? _user;
  String get user => _user ?? '';
  bool hasUser() => _user != null;

  // "android" field.
  bool? _android;
  bool get android => _android ?? false;
  bool hasAndroid() => _android != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "ios" field.
  bool? _ios;
  bool get ios => _ios ?? false;
  bool hasIos() => _ios != null;

  // "app_version" field.
  String? _appVersion;
  String get appVersion => _appVersion ?? '';
  bool hasAppVersion() => _appVersion != null;

  // "show_user" field.
  bool? _showUser;
  bool get showUser => _showUser ?? false;
  bool hasShowUser() => _showUser != null;

  // "journal_entry" field.
  DocumentReference? _journalEntry;
  DocumentReference? get journalEntry => _journalEntry;
  bool hasJournalEntry() => _journalEntry != null;

  // "bible_study_doc" field.
  DocumentReference? _bibleStudyDoc;
  DocumentReference? get bibleStudyDoc => _bibleStudyDoc;
  bool hasBibleStudyDoc() => _bibleStudyDoc != null;

  // "prayer" field.
  DocumentReference? _prayer;
  DocumentReference? get prayer => _prayer;
  bool hasPrayer() => _prayer != null;

  void _initializeFields() {
    _activity = snapshotData['activity'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _user = snapshotData['user'] as String?;
    _android = snapshotData['android'] as bool?;
    _location = snapshotData['location'] as LatLng?;
    _ios = snapshotData['ios'] as bool?;
    _appVersion = snapshotData['app_version'] as String?;
    _showUser = snapshotData['show_user'] as bool?;
    _journalEntry = snapshotData['journal_entry'] as DocumentReference?;
    _bibleStudyDoc = snapshotData['bible_study_doc'] as DocumentReference?;
    _prayer = snapshotData['prayer'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('activity_log');

  static Stream<ActivityLogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActivityLogRecord.fromSnapshot(s));

  static Future<ActivityLogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActivityLogRecord.fromSnapshot(s));

  static ActivityLogRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActivityLogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActivityLogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActivityLogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActivityLogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActivityLogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivityLogRecordData({
  String? activity,
  DateTime? time,
  String? user,
  bool? android,
  LatLng? location,
  bool? ios,
  String? appVersion,
  bool? showUser,
  DocumentReference? journalEntry,
  DocumentReference? bibleStudyDoc,
  DocumentReference? prayer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'activity': activity,
      'time': time,
      'user': user,
      'android': android,
      'location': location,
      'ios': ios,
      'app_version': appVersion,
      'show_user': showUser,
      'journal_entry': journalEntry,
      'bible_study_doc': bibleStudyDoc,
      'prayer': prayer,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActivityLogRecordDocumentEquality implements Equality<ActivityLogRecord> {
  const ActivityLogRecordDocumentEquality();

  @override
  bool equals(ActivityLogRecord? e1, ActivityLogRecord? e2) {
    return e1?.activity == e2?.activity &&
        e1?.time == e2?.time &&
        e1?.user == e2?.user &&
        e1?.android == e2?.android &&
        e1?.location == e2?.location &&
        e1?.ios == e2?.ios &&
        e1?.appVersion == e2?.appVersion &&
        e1?.showUser == e2?.showUser &&
        e1?.journalEntry == e2?.journalEntry &&
        e1?.bibleStudyDoc == e2?.bibleStudyDoc &&
        e1?.prayer == e2?.prayer;
  }

  @override
  int hash(ActivityLogRecord? e) => const ListEquality().hash([
        e?.activity,
        e?.time,
        e?.user,
        e?.android,
        e?.location,
        e?.ios,
        e?.appVersion,
        e?.showUser,
        e?.journalEntry,
        e?.bibleStudyDoc,
        e?.prayer
      ]);

  @override
  bool isValidKey(Object? o) => o is ActivityLogRecord;
}
