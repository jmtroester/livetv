import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MiscRecord extends FirestoreRecord {
  MiscRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "home_image" field.
  String? _homeImage;
  String get homeImage => _homeImage ?? '';
  bool hasHomeImage() => _homeImage != null;

  // "home_text" field.
  String? _homeText;
  String get homeText => _homeText ?? '';
  bool hasHomeText() => _homeText != null;

  // "home_image_link" field.
  String? _homeImageLink;
  String get homeImageLink => _homeImageLink ?? '';
  bool hasHomeImageLink() => _homeImageLink != null;

  // "app_version" field.
  String? _appVersion;
  String get appVersion => _appVersion ?? '';
  bool hasAppVersion() => _appVersion != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "totalFullSermons" field.
  int? _totalFullSermons;
  int get totalFullSermons => _totalFullSermons ?? 0;
  bool hasTotalFullSermons() => _totalFullSermons != null;

  // "totalMiniSermons" field.
  int? _totalMiniSermons;
  int get totalMiniSermons => _totalMiniSermons ?? 0;
  bool hasTotalMiniSermons() => _totalMiniSermons != null;

  // "totalAudioSermons" field.
  int? _totalAudioSermons;
  int get totalAudioSermons => _totalAudioSermons ?? 0;
  bool hasTotalAudioSermons() => _totalAudioSermons != null;

  // "totalPodcasts" field.
  int? _totalPodcasts;
  int get totalPodcasts => _totalPodcasts ?? 0;
  bool hasTotalPodcasts() => _totalPodcasts != null;

  // "c_id" field.
  int? _cId;
  int get cId => _cId ?? 0;
  bool hasCId() => _cId != null;

  // "push_notifications_for_social" field.
  bool? _pushNotificationsForSocial;
  bool get pushNotificationsForSocial => _pushNotificationsForSocial ?? false;
  bool hasPushNotificationsForSocial() => _pushNotificationsForSocial != null;

  // "live_video" field.
  bool? _liveVideo;
  bool get liveVideo => _liveVideo ?? false;
  bool hasLiveVideo() => _liveVideo != null;

  // "test_video_string" field.
  String? _testVideoString;
  String get testVideoString => _testVideoString ?? '';
  bool hasTestVideoString() => _testVideoString != null;

  void _initializeFields() {
    _homeImage = snapshotData['home_image'] as String?;
    _homeText = snapshotData['home_text'] as String?;
    _homeImageLink = snapshotData['home_image_link'] as String?;
    _appVersion = snapshotData['app_version'] as String?;
    _id = castToType<int>(snapshotData['id']);
    _totalFullSermons = castToType<int>(snapshotData['totalFullSermons']);
    _totalMiniSermons = castToType<int>(snapshotData['totalMiniSermons']);
    _totalAudioSermons = castToType<int>(snapshotData['totalAudioSermons']);
    _totalPodcasts = castToType<int>(snapshotData['totalPodcasts']);
    _cId = castToType<int>(snapshotData['c_id']);
    _pushNotificationsForSocial =
        snapshotData['push_notifications_for_social'] as bool?;
    _liveVideo = snapshotData['live_video'] as bool?;
    _testVideoString = snapshotData['test_video_string'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('misc');

  static Stream<MiscRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MiscRecord.fromSnapshot(s));

  static Future<MiscRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MiscRecord.fromSnapshot(s));

  static MiscRecord fromSnapshot(DocumentSnapshot snapshot) => MiscRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MiscRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MiscRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MiscRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MiscRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMiscRecordData({
  String? homeImage,
  String? homeText,
  String? homeImageLink,
  String? appVersion,
  int? id,
  int? totalFullSermons,
  int? totalMiniSermons,
  int? totalAudioSermons,
  int? totalPodcasts,
  int? cId,
  bool? pushNotificationsForSocial,
  bool? liveVideo,
  String? testVideoString,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'home_image': homeImage,
      'home_text': homeText,
      'home_image_link': homeImageLink,
      'app_version': appVersion,
      'id': id,
      'totalFullSermons': totalFullSermons,
      'totalMiniSermons': totalMiniSermons,
      'totalAudioSermons': totalAudioSermons,
      'totalPodcasts': totalPodcasts,
      'c_id': cId,
      'push_notifications_for_social': pushNotificationsForSocial,
      'live_video': liveVideo,
      'test_video_string': testVideoString,
    }.withoutNulls,
  );

  return firestoreData;
}

class MiscRecordDocumentEquality implements Equality<MiscRecord> {
  const MiscRecordDocumentEquality();

  @override
  bool equals(MiscRecord? e1, MiscRecord? e2) {
    return e1?.homeImage == e2?.homeImage &&
        e1?.homeText == e2?.homeText &&
        e1?.homeImageLink == e2?.homeImageLink &&
        e1?.appVersion == e2?.appVersion &&
        e1?.id == e2?.id &&
        e1?.totalFullSermons == e2?.totalFullSermons &&
        e1?.totalMiniSermons == e2?.totalMiniSermons &&
        e1?.totalAudioSermons == e2?.totalAudioSermons &&
        e1?.totalPodcasts == e2?.totalPodcasts &&
        e1?.cId == e2?.cId &&
        e1?.pushNotificationsForSocial == e2?.pushNotificationsForSocial &&
        e1?.liveVideo == e2?.liveVideo &&
        e1?.testVideoString == e2?.testVideoString;
  }

  @override
  int hash(MiscRecord? e) => const ListEquality().hash([
        e?.homeImage,
        e?.homeText,
        e?.homeImageLink,
        e?.appVersion,
        e?.id,
        e?.totalFullSermons,
        e?.totalMiniSermons,
        e?.totalAudioSermons,
        e?.totalPodcasts,
        e?.cId,
        e?.pushNotificationsForSocial,
        e?.liveVideo,
        e?.testVideoString
      ]);

  @override
  bool isValidKey(Object? o) => o is MiscRecord;
}
