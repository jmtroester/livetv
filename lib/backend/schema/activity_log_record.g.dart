// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_log_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ActivityLogRecord> _$activityLogRecordSerializer =
    new _$ActivityLogRecordSerializer();

class _$ActivityLogRecordSerializer
    implements StructuredSerializer<ActivityLogRecord> {
  @override
  final Iterable<Type> types = const [ActivityLogRecord, _$ActivityLogRecord];
  @override
  final String wireName = 'ActivityLogRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ActivityLogRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.activity;
    if (value != null) {
      result
        ..add('activity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.time;
    if (value != null) {
      result
        ..add('time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.android;
    if (value != null) {
      result
        ..add('android')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.ios;
    if (value != null) {
      result
        ..add('ios')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.appVersion;
    if (value != null) {
      result
        ..add('app_version')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  ActivityLogRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ActivityLogRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'activity':
          result.activity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'android':
          result.android = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
        case 'ios':
          result.ios = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'app_version':
          result.appVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$ActivityLogRecord extends ActivityLogRecord {
  @override
  final String activity;
  @override
  final DateTime time;
  @override
  final String user;
  @override
  final bool android;
  @override
  final LatLng location;
  @override
  final bool ios;
  @override
  final String appVersion;
  @override
  final DocumentReference<Object> reference;

  factory _$ActivityLogRecord(
          [void Function(ActivityLogRecordBuilder) updates]) =>
      (new ActivityLogRecordBuilder()..update(updates)).build();

  _$ActivityLogRecord._(
      {this.activity,
      this.time,
      this.user,
      this.android,
      this.location,
      this.ios,
      this.appVersion,
      this.reference})
      : super._();

  @override
  ActivityLogRecord rebuild(void Function(ActivityLogRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActivityLogRecordBuilder toBuilder() =>
      new ActivityLogRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActivityLogRecord &&
        activity == other.activity &&
        time == other.time &&
        user == other.user &&
        android == other.android &&
        location == other.location &&
        ios == other.ios &&
        appVersion == other.appVersion &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, activity.hashCode), time.hashCode),
                            user.hashCode),
                        android.hashCode),
                    location.hashCode),
                ios.hashCode),
            appVersion.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ActivityLogRecord')
          ..add('activity', activity)
          ..add('time', time)
          ..add('user', user)
          ..add('android', android)
          ..add('location', location)
          ..add('ios', ios)
          ..add('appVersion', appVersion)
          ..add('reference', reference))
        .toString();
  }
}

class ActivityLogRecordBuilder
    implements Builder<ActivityLogRecord, ActivityLogRecordBuilder> {
  _$ActivityLogRecord _$v;

  String _activity;
  String get activity => _$this._activity;
  set activity(String activity) => _$this._activity = activity;

  DateTime _time;
  DateTime get time => _$this._time;
  set time(DateTime time) => _$this._time = time;

  String _user;
  String get user => _$this._user;
  set user(String user) => _$this._user = user;

  bool _android;
  bool get android => _$this._android;
  set android(bool android) => _$this._android = android;

  LatLng _location;
  LatLng get location => _$this._location;
  set location(LatLng location) => _$this._location = location;

  bool _ios;
  bool get ios => _$this._ios;
  set ios(bool ios) => _$this._ios = ios;

  String _appVersion;
  String get appVersion => _$this._appVersion;
  set appVersion(String appVersion) => _$this._appVersion = appVersion;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ActivityLogRecordBuilder() {
    ActivityLogRecord._initializeBuilder(this);
  }

  ActivityLogRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _activity = $v.activity;
      _time = $v.time;
      _user = $v.user;
      _android = $v.android;
      _location = $v.location;
      _ios = $v.ios;
      _appVersion = $v.appVersion;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActivityLogRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ActivityLogRecord;
  }

  @override
  void update(void Function(ActivityLogRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ActivityLogRecord build() {
    final _$result = _$v ??
        new _$ActivityLogRecord._(
            activity: activity,
            time: time,
            user: user,
            android: android,
            location: location,
            ios: ios,
            appVersion: appVersion,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
