import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "sermons_watched" field.
  List<int>? _sermonsWatched;
  List<int> get sermonsWatched => _sermonsWatched ?? const [];
  bool hasSermonsWatched() => _sermonsWatched != null;

  // "shorts_watched" field.
  List<int>? _shortsWatched;
  List<int> get shortsWatched => _shortsWatched ?? const [];
  bool hasShortsWatched() => _shortsWatched != null;

  // "podcasts_watched" field.
  List<int>? _podcastsWatched;
  List<int> get podcastsWatched => _podcastsWatched ?? const [];
  bool hasPodcastsWatched() => _podcastsWatched != null;

  // "admin" field.
  bool? _admin;
  bool get admin => _admin ?? false;
  bool hasAdmin() => _admin != null;

  // "app_version" field.
  String? _appVersion;
  String get appVersion => _appVersion ?? '';
  bool hasAppVersion() => _appVersion != null;

  // "remind_devo" field.
  bool? _remindDevo;
  bool get remindDevo => _remindDevo ?? false;
  bool hasRemindDevo() => _remindDevo != null;

  // "devo_alert" field.
  bool? _devoAlert;
  bool get devoAlert => _devoAlert ?? false;
  bool hasDevoAlert() => _devoAlert != null;

  // "devo_dates" field.
  List<String>? _devoDates;
  List<String> get devoDates => _devoDates ?? const [];
  bool hasDevoDates() => _devoDates != null;

  // "non_sermon_podcasts_watched" field.
  List<int>? _nonSermonPodcastsWatched;
  List<int> get nonSermonPodcastsWatched =>
      _nonSermonPodcastsWatched ?? const [];
  bool hasNonSermonPodcastsWatched() => _nonSermonPodcastsWatched != null;

  // "last_login" field.
  DateTime? _lastLogin;
  DateTime? get lastLogin => _lastLogin;
  bool hasLastLogin() => _lastLogin != null;

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  bool hasPoints() => _points != null;

  // "level_id" field.
  int? _levelId;
  int get levelId => _levelId ?? 0;
  bool hasLevelId() => _levelId != null;

  // "mentor" field.
  DocumentReference? _mentor;
  DocumentReference? get mentor => _mentor;
  bool hasMentorField() => _mentor != null;

  // "mentee" field.
  List<DocumentReference>? _mentee;
  List<DocumentReference> get mentee => _mentee ?? const [];
  bool hasMentee() => _mentee != null;

  // "item_1" field.
  List<String>? _item1;
  List<String> get item1 => _item1 ?? const [];
  bool hasItem1() => _item1 != null;

  // "item_2" field.
  List<String>? _item2;
  List<String> get item2 => _item2 ?? const [];
  bool hasItem2() => _item2 != null;

  // "is_mentor" field.
  bool? _isMentor;
  bool get isMentor => _isMentor ?? false;
  bool hasIsMentor() => _isMentor != null;

  // "has_mentor" field.
  bool? _hasMentor;
  bool get hasMentor => _hasMentor ?? false;
  bool hasHasMentor() => _hasMentor != null;

  // "item_3" field.
  List<String>? _item3;
  List<String> get item3 => _item3 ?? const [];
  bool hasItem3() => _item3 != null;

  // "checked_prayers" field.
  List<String>? _checkedPrayers;
  List<String> get checkedPrayers => _checkedPrayers ?? const [];
  bool hasCheckedPrayers() => _checkedPrayers != null;

  // "last_visit_to_social_feed" field.
  DateTime? _lastVisitToSocialFeed;
  DateTime? get lastVisitToSocialFeed => _lastVisitToSocialFeed;
  bool hasLastVisitToSocialFeed() => _lastVisitToSocialFeed != null;

  // "my_church" field.
  DocumentReference? _myChurch;
  DocumentReference? get myChurch => _myChurch;
  bool hasMyChurch() => _myChurch != null;

  // "discipleship_help_current" field.
  DocumentReference? _discipleshipHelpCurrent;
  DocumentReference? get discipleshipHelpCurrent => _discipleshipHelpCurrent;
  bool hasDiscipleshipHelpCurrent() => _discipleshipHelpCurrent != null;

  // "discipleship_help_name" field.
  String? _discipleshipHelpName;
  String get discipleshipHelpName => _discipleshipHelpName ?? '';
  bool hasDiscipleshipHelpName() => _discipleshipHelpName != null;

  // "live_streams_viewed" field.
  List<int>? _liveStreamsViewed;
  List<int> get liveStreamsViewed => _liveStreamsViewed ?? const [];
  bool hasLiveStreamsViewed() => _liveStreamsViewed != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _sermonsWatched = getDataList(snapshotData['sermons_watched']);
    _shortsWatched = getDataList(snapshotData['shorts_watched']);
    _podcastsWatched = getDataList(snapshotData['podcasts_watched']);
    _admin = snapshotData['admin'] as bool?;
    _appVersion = snapshotData['app_version'] as String?;
    _remindDevo = snapshotData['remind_devo'] as bool?;
    _devoAlert = snapshotData['devo_alert'] as bool?;
    _devoDates = getDataList(snapshotData['devo_dates']);
    _nonSermonPodcastsWatched =
        getDataList(snapshotData['non_sermon_podcasts_watched']);
    _lastLogin = snapshotData['last_login'] as DateTime?;
    _points = castToType<int>(snapshotData['points']);
    _levelId = castToType<int>(snapshotData['level_id']);
    _mentor = snapshotData['mentor'] as DocumentReference?;
    _mentee = getDataList(snapshotData['mentee']);
    _item1 = getDataList(snapshotData['item_1']);
    _item2 = getDataList(snapshotData['item_2']);
    _isMentor = snapshotData['is_mentor'] as bool?;
    _hasMentor = snapshotData['has_mentor'] as bool?;
    _item3 = getDataList(snapshotData['item_3']);
    _checkedPrayers = getDataList(snapshotData['checked_prayers']);
    _lastVisitToSocialFeed =
        snapshotData['last_visit_to_social_feed'] as DateTime?;
    _myChurch = snapshotData['my_church'] as DocumentReference?;
    _discipleshipHelpCurrent =
        snapshotData['discipleship_help_current'] as DocumentReference?;
    _discipleshipHelpName = snapshotData['discipleship_help_name'] as String?;
    _liveStreamsViewed = getDataList(snapshotData['live_streams_viewed']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? admin,
  String? appVersion,
  bool? remindDevo,
  bool? devoAlert,
  DateTime? lastLogin,
  int? points,
  int? levelId,
  DocumentReference? mentor,
  bool? isMentor,
  bool? hasMentor,
  DateTime? lastVisitToSocialFeed,
  DocumentReference? myChurch,
  DocumentReference? discipleshipHelpCurrent,
  String? discipleshipHelpName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'admin': admin,
      'app_version': appVersion,
      'remind_devo': remindDevo,
      'devo_alert': devoAlert,
      'last_login': lastLogin,
      'points': points,
      'level_id': levelId,
      'mentor': mentor,
      'is_mentor': isMentor,
      'has_mentor': hasMentor,
      'last_visit_to_social_feed': lastVisitToSocialFeed,
      'my_church': myChurch,
      'discipleship_help_current': discipleshipHelpCurrent,
      'discipleship_help_name': discipleshipHelpName,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.sermonsWatched, e2?.sermonsWatched) &&
        listEquality.equals(e1?.shortsWatched, e2?.shortsWatched) &&
        listEquality.equals(e1?.podcastsWatched, e2?.podcastsWatched) &&
        e1?.admin == e2?.admin &&
        e1?.appVersion == e2?.appVersion &&
        e1?.remindDevo == e2?.remindDevo &&
        e1?.devoAlert == e2?.devoAlert &&
        listEquality.equals(e1?.devoDates, e2?.devoDates) &&
        listEquality.equals(
            e1?.nonSermonPodcastsWatched, e2?.nonSermonPodcastsWatched) &&
        e1?.lastLogin == e2?.lastLogin &&
        e1?.points == e2?.points &&
        e1?.levelId == e2?.levelId &&
        e1?.mentor == e2?.mentor &&
        listEquality.equals(e1?.mentee, e2?.mentee) &&
        listEquality.equals(e1?.item1, e2?.item1) &&
        listEquality.equals(e1?.item2, e2?.item2) &&
        e1?.isMentor == e2?.isMentor &&
        e1?.hasMentor == e2?.hasMentor &&
        listEquality.equals(e1?.item3, e2?.item3) &&
        listEquality.equals(e1?.checkedPrayers, e2?.checkedPrayers) &&
        e1?.lastVisitToSocialFeed == e2?.lastVisitToSocialFeed &&
        e1?.myChurch == e2?.myChurch &&
        e1?.discipleshipHelpCurrent == e2?.discipleshipHelpCurrent &&
        e1?.discipleshipHelpName == e2?.discipleshipHelpName &&
        listEquality.equals(e1?.liveStreamsViewed, e2?.liveStreamsViewed);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.sermonsWatched,
        e?.shortsWatched,
        e?.podcastsWatched,
        e?.admin,
        e?.appVersion,
        e?.remindDevo,
        e?.devoAlert,
        e?.devoDates,
        e?.nonSermonPodcastsWatched,
        e?.lastLogin,
        e?.points,
        e?.levelId,
        e?.mentor,
        e?.mentee,
        e?.item1,
        e?.item2,
        e?.isMentor,
        e?.hasMentor,
        e?.item3,
        e?.checkedPrayers,
        e?.lastVisitToSocialFeed,
        e?.myChurch,
        e?.discipleshipHelpCurrent,
        e?.discipleshipHelpName,
        e?.liveStreamsViewed
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
