import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'sermons_watched')
  BuiltList<int> get sermonsWatched;

  @nullable
  @BuiltValueField(wireName: 'shorts_watched')
  BuiltList<int> get shortsWatched;

  @nullable
  @BuiltValueField(wireName: 'podcasts_watched')
  BuiltList<int> get podcastsWatched;

  @nullable
  bool get admin;

  @nullable
  @BuiltValueField(wireName: 'app_version')
  String get appVersion;

  @nullable
  @BuiltValueField(wireName: 'remind_devo')
  bool get remindDevo;

  @nullable
  @BuiltValueField(wireName: 'devo_alert')
  bool get devoAlert;

  @nullable
  @BuiltValueField(wireName: 'devo_dates')
  BuiltList<String> get devoDates;

  @nullable
  @BuiltValueField(wireName: 'non_sermon_podcasts_watched')
  BuiltList<int> get nonSermonPodcastsWatched;

  @nullable
  @BuiltValueField(wireName: 'last_login')
  DateTime get lastLogin;

  @nullable
  int get points;

  @nullable
  @BuiltValueField(wireName: 'level_id')
  int get levelId;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..sermonsWatched = ListBuilder()
    ..shortsWatched = ListBuilder()
    ..podcastsWatched = ListBuilder()
    ..admin = false
    ..appVersion = ''
    ..remindDevo = false
    ..devoAlert = false
    ..devoDates = ListBuilder()
    ..nonSermonPodcastsWatched = ListBuilder()
    ..points = 0
    ..levelId = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
  bool admin,
  String appVersion,
  bool remindDevo,
  bool devoAlert,
  DateTime lastLogin,
  int points,
  int levelId,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..sermonsWatched = null
          ..shortsWatched = null
          ..podcastsWatched = null
          ..admin = admin
          ..appVersion = appVersion
          ..remindDevo = remindDevo
          ..devoAlert = devoAlert
          ..devoDates = null
          ..nonSermonPodcastsWatched = null
          ..lastLogin = lastLogin
          ..points = points
          ..levelId = levelId));
