// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sermonsWatched;
    if (value != null) {
      result
        ..add('sermons_watched')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.shortsWatched;
    if (value != null) {
      result
        ..add('shorts_watched')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.podcastsWatched;
    if (value != null) {
      result
        ..add('podcasts_watched')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.admin;
    if (value != null) {
      result
        ..add('admin')
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
    value = object.remindDevo;
    if (value != null) {
      result
        ..add('remind_devo')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.devoAlert;
    if (value != null) {
      result
        ..add('devo_alert')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.devoDates;
    if (value != null) {
      result
        ..add('devo_dates')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.nonSermonPodcastsWatched;
    if (value != null) {
      result
        ..add('non_sermon_podcasts_watched')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.lastLogin;
    if (value != null) {
      result
        ..add('last_login')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.points;
    if (value != null) {
      result
        ..add('points')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.levelId;
    if (value != null) {
      result
        ..add('level_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sermons_watched':
          result.sermonsWatched.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<Object>);
          break;
        case 'shorts_watched':
          result.shortsWatched.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<Object>);
          break;
        case 'podcasts_watched':
          result.podcastsWatched.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<Object>);
          break;
        case 'admin':
          result.admin = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'app_version':
          result.appVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'remind_devo':
          result.remindDevo = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'devo_alert':
          result.devoAlert = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'devo_dates':
          result.devoDates.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'non_sermon_podcasts_watched':
          result.nonSermonPodcastsWatched.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<Object>);
          break;
        case 'last_login':
          result.lastLogin = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'points':
          result.points = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'level_id':
          result.levelId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$UsersRecord extends UsersRecord {
  @override
  final String email;
  @override
  final String displayName;
  @override
  final String photoUrl;
  @override
  final String uid;
  @override
  final DateTime createdTime;
  @override
  final String phoneNumber;
  @override
  final BuiltList<int> sermonsWatched;
  @override
  final BuiltList<int> shortsWatched;
  @override
  final BuiltList<int> podcastsWatched;
  @override
  final bool admin;
  @override
  final String appVersion;
  @override
  final bool remindDevo;
  @override
  final bool devoAlert;
  @override
  final BuiltList<String> devoDates;
  @override
  final BuiltList<int> nonSermonPodcastsWatched;
  @override
  final DateTime lastLogin;
  @override
  final int points;
  @override
  final int levelId;
  @override
  final DocumentReference<Object> reference;

  factory _$UsersRecord([void Function(UsersRecordBuilder) updates]) =>
      (new UsersRecordBuilder()..update(updates)).build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.sermonsWatched,
      this.shortsWatched,
      this.podcastsWatched,
      this.admin,
      this.appVersion,
      this.remindDevo,
      this.devoAlert,
      this.devoDates,
      this.nonSermonPodcastsWatched,
      this.lastLogin,
      this.points,
      this.levelId,
      this.reference})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        sermonsWatched == other.sermonsWatched &&
        shortsWatched == other.shortsWatched &&
        podcastsWatched == other.podcastsWatched &&
        admin == other.admin &&
        appVersion == other.appVersion &&
        remindDevo == other.remindDevo &&
        devoAlert == other.devoAlert &&
        devoDates == other.devoDates &&
        nonSermonPodcastsWatched == other.nonSermonPodcastsWatched &&
        lastLogin == other.lastLogin &&
        points == other.points &&
        levelId == other.levelId &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc(
                                                                                0,
                                                                                email
                                                                                    .hashCode),
                                                                            displayName
                                                                                .hashCode),
                                                                        photoUrl
                                                                            .hashCode),
                                                                    uid
                                                                        .hashCode),
                                                                createdTime
                                                                    .hashCode),
                                                            phoneNumber
                                                                .hashCode),
                                                        sermonsWatched
                                                            .hashCode),
                                                    shortsWatched.hashCode),
                                                podcastsWatched.hashCode),
                                            admin.hashCode),
                                        appVersion.hashCode),
                                    remindDevo.hashCode),
                                devoAlert.hashCode),
                            devoDates.hashCode),
                        nonSermonPodcastsWatched.hashCode),
                    lastLogin.hashCode),
                points.hashCode),
            levelId.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('sermonsWatched', sermonsWatched)
          ..add('shortsWatched', shortsWatched)
          ..add('podcastsWatched', podcastsWatched)
          ..add('admin', admin)
          ..add('appVersion', appVersion)
          ..add('remindDevo', remindDevo)
          ..add('devoAlert', devoAlert)
          ..add('devoDates', devoDates)
          ..add('nonSermonPodcastsWatched', nonSermonPodcastsWatched)
          ..add('lastLogin', lastLogin)
          ..add('points', points)
          ..add('levelId', levelId)
          ..add('reference', reference))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  ListBuilder<int> _sermonsWatched;
  ListBuilder<int> get sermonsWatched =>
      _$this._sermonsWatched ??= new ListBuilder<int>();
  set sermonsWatched(ListBuilder<int> sermonsWatched) =>
      _$this._sermonsWatched = sermonsWatched;

  ListBuilder<int> _shortsWatched;
  ListBuilder<int> get shortsWatched =>
      _$this._shortsWatched ??= new ListBuilder<int>();
  set shortsWatched(ListBuilder<int> shortsWatched) =>
      _$this._shortsWatched = shortsWatched;

  ListBuilder<int> _podcastsWatched;
  ListBuilder<int> get podcastsWatched =>
      _$this._podcastsWatched ??= new ListBuilder<int>();
  set podcastsWatched(ListBuilder<int> podcastsWatched) =>
      _$this._podcastsWatched = podcastsWatched;

  bool _admin;
  bool get admin => _$this._admin;
  set admin(bool admin) => _$this._admin = admin;

  String _appVersion;
  String get appVersion => _$this._appVersion;
  set appVersion(String appVersion) => _$this._appVersion = appVersion;

  bool _remindDevo;
  bool get remindDevo => _$this._remindDevo;
  set remindDevo(bool remindDevo) => _$this._remindDevo = remindDevo;

  bool _devoAlert;
  bool get devoAlert => _$this._devoAlert;
  set devoAlert(bool devoAlert) => _$this._devoAlert = devoAlert;

  ListBuilder<String> _devoDates;
  ListBuilder<String> get devoDates =>
      _$this._devoDates ??= new ListBuilder<String>();
  set devoDates(ListBuilder<String> devoDates) => _$this._devoDates = devoDates;

  ListBuilder<int> _nonSermonPodcastsWatched;
  ListBuilder<int> get nonSermonPodcastsWatched =>
      _$this._nonSermonPodcastsWatched ??= new ListBuilder<int>();
  set nonSermonPodcastsWatched(ListBuilder<int> nonSermonPodcastsWatched) =>
      _$this._nonSermonPodcastsWatched = nonSermonPodcastsWatched;

  DateTime _lastLogin;
  DateTime get lastLogin => _$this._lastLogin;
  set lastLogin(DateTime lastLogin) => _$this._lastLogin = lastLogin;

  int _points;
  int get points => _$this._points;
  set points(int points) => _$this._points = points;

  int _levelId;
  int get levelId => _$this._levelId;
  set levelId(int levelId) => _$this._levelId = levelId;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _sermonsWatched = $v.sermonsWatched?.toBuilder();
      _shortsWatched = $v.shortsWatched?.toBuilder();
      _podcastsWatched = $v.podcastsWatched?.toBuilder();
      _admin = $v.admin;
      _appVersion = $v.appVersion;
      _remindDevo = $v.remindDevo;
      _devoAlert = $v.devoAlert;
      _devoDates = $v.devoDates?.toBuilder();
      _nonSermonPodcastsWatched = $v.nonSermonPodcastsWatched?.toBuilder();
      _lastLogin = $v.lastLogin;
      _points = $v.points;
      _levelId = $v.levelId;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UsersRecord build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              sermonsWatched: _sermonsWatched?.build(),
              shortsWatched: _shortsWatched?.build(),
              podcastsWatched: _podcastsWatched?.build(),
              admin: admin,
              appVersion: appVersion,
              remindDevo: remindDevo,
              devoAlert: devoAlert,
              devoDates: _devoDates?.build(),
              nonSermonPodcastsWatched: _nonSermonPodcastsWatched?.build(),
              lastLogin: lastLogin,
              points: points,
              levelId: levelId,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'sermonsWatched';
        _sermonsWatched?.build();
        _$failedField = 'shortsWatched';
        _shortsWatched?.build();
        _$failedField = 'podcastsWatched';
        _podcastsWatched?.build();

        _$failedField = 'devoDates';
        _devoDates?.build();
        _$failedField = 'nonSermonPodcastsWatched';
        _nonSermonPodcastsWatched?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
