import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'activity_log_record.g.dart';

abstract class ActivityLogRecord
    implements Built<ActivityLogRecord, ActivityLogRecordBuilder> {
  static Serializer<ActivityLogRecord> get serializer =>
      _$activityLogRecordSerializer;

  @nullable
  String get activity;

  @nullable
  DateTime get time;

  @nullable
  String get user;

  @nullable
  bool get android;

  @nullable
  LatLng get location;

  @nullable
  bool get ios;

  @nullable
  @BuiltValueField(wireName: 'app_version')
  String get appVersion;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ActivityLogRecordBuilder builder) => builder
    ..activity = ''
    ..user = ''
    ..android = false
    ..ios = false
    ..appVersion = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('activity_log');

  static Stream<ActivityLogRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ActivityLogRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ActivityLogRecord._();
  factory ActivityLogRecord([void Function(ActivityLogRecordBuilder) updates]) =
      _$ActivityLogRecord;

  static ActivityLogRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createActivityLogRecordData({
  String activity,
  DateTime time,
  String user,
  bool android,
  LatLng location,
  bool ios,
  String appVersion,
}) =>
    serializers.toFirestore(
        ActivityLogRecord.serializer,
        ActivityLogRecord((a) => a
          ..activity = activity
          ..time = time
          ..user = user
          ..android = android
          ..location = location
          ..ios = ios
          ..appVersion = appVersion));
