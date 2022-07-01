// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devos_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DevosRecord> _$devosRecordSerializer = new _$DevosRecordSerializer();

class _$DevosRecordSerializer implements StructuredSerializer<DevosRecord> {
  @override
  final Iterable<Type> types = const [DevosRecord, _$DevosRecord];
  @override
  final String wireName = 'DevosRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, DevosRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.verseReference;
    if (value != null) {
      result
        ..add('verse_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.dateString;
    if (value != null) {
      result
        ..add('date_string')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photo;
    if (value != null) {
      result
        ..add('photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.catechismTitle;
    if (value != null) {
      result
        ..add('catechism_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.catechismDetails;
    if (value != null) {
      result
        ..add('catechism_details')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.prayerTopic;
    if (value != null) {
      result
        ..add('prayer_topic')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.prayerDetails;
    if (value != null) {
      result
        ..add('prayer_details')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.possibleQuestion1;
    if (value != null) {
      result
        ..add('possible_question_1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.possibleQuestion2;
    if (value != null) {
      result
        ..add('possible_question_2')
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
  DevosRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DevosRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'verse_reference':
          result.verseReference = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'date_string':
          result.dateString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo':
          result.photo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'catechism_title':
          result.catechismTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'catechism_details':
          result.catechismDetails = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'prayer_topic':
          result.prayerTopic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'prayer_details':
          result.prayerDetails = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'possible_question_1':
          result.possibleQuestion1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'possible_question_2':
          result.possibleQuestion2 = serializers.deserialize(value,
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

class _$DevosRecord extends DevosRecord {
  @override
  final String verseReference;
  @override
  final DateTime date;
  @override
  final String dateString;
  @override
  final String photo;
  @override
  final String catechismTitle;
  @override
  final String catechismDetails;
  @override
  final String prayerTopic;
  @override
  final String prayerDetails;
  @override
  final String possibleQuestion1;
  @override
  final String possibleQuestion2;
  @override
  final DocumentReference<Object> reference;

  factory _$DevosRecord([void Function(DevosRecordBuilder) updates]) =>
      (new DevosRecordBuilder()..update(updates)).build();

  _$DevosRecord._(
      {this.verseReference,
      this.date,
      this.dateString,
      this.photo,
      this.catechismTitle,
      this.catechismDetails,
      this.prayerTopic,
      this.prayerDetails,
      this.possibleQuestion1,
      this.possibleQuestion2,
      this.reference})
      : super._();

  @override
  DevosRecord rebuild(void Function(DevosRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DevosRecordBuilder toBuilder() => new DevosRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DevosRecord &&
        verseReference == other.verseReference &&
        date == other.date &&
        dateString == other.dateString &&
        photo == other.photo &&
        catechismTitle == other.catechismTitle &&
        catechismDetails == other.catechismDetails &&
        prayerTopic == other.prayerTopic &&
        prayerDetails == other.prayerDetails &&
        possibleQuestion1 == other.possibleQuestion1 &&
        possibleQuestion2 == other.possibleQuestion2 &&
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
                                        $jc($jc(0, verseReference.hashCode),
                                            date.hashCode),
                                        dateString.hashCode),
                                    photo.hashCode),
                                catechismTitle.hashCode),
                            catechismDetails.hashCode),
                        prayerTopic.hashCode),
                    prayerDetails.hashCode),
                possibleQuestion1.hashCode),
            possibleQuestion2.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DevosRecord')
          ..add('verseReference', verseReference)
          ..add('date', date)
          ..add('dateString', dateString)
          ..add('photo', photo)
          ..add('catechismTitle', catechismTitle)
          ..add('catechismDetails', catechismDetails)
          ..add('prayerTopic', prayerTopic)
          ..add('prayerDetails', prayerDetails)
          ..add('possibleQuestion1', possibleQuestion1)
          ..add('possibleQuestion2', possibleQuestion2)
          ..add('reference', reference))
        .toString();
  }
}

class DevosRecordBuilder implements Builder<DevosRecord, DevosRecordBuilder> {
  _$DevosRecord _$v;

  String _verseReference;
  String get verseReference => _$this._verseReference;
  set verseReference(String verseReference) =>
      _$this._verseReference = verseReference;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  String _dateString;
  String get dateString => _$this._dateString;
  set dateString(String dateString) => _$this._dateString = dateString;

  String _photo;
  String get photo => _$this._photo;
  set photo(String photo) => _$this._photo = photo;

  String _catechismTitle;
  String get catechismTitle => _$this._catechismTitle;
  set catechismTitle(String catechismTitle) =>
      _$this._catechismTitle = catechismTitle;

  String _catechismDetails;
  String get catechismDetails => _$this._catechismDetails;
  set catechismDetails(String catechismDetails) =>
      _$this._catechismDetails = catechismDetails;

  String _prayerTopic;
  String get prayerTopic => _$this._prayerTopic;
  set prayerTopic(String prayerTopic) => _$this._prayerTopic = prayerTopic;

  String _prayerDetails;
  String get prayerDetails => _$this._prayerDetails;
  set prayerDetails(String prayerDetails) =>
      _$this._prayerDetails = prayerDetails;

  String _possibleQuestion1;
  String get possibleQuestion1 => _$this._possibleQuestion1;
  set possibleQuestion1(String possibleQuestion1) =>
      _$this._possibleQuestion1 = possibleQuestion1;

  String _possibleQuestion2;
  String get possibleQuestion2 => _$this._possibleQuestion2;
  set possibleQuestion2(String possibleQuestion2) =>
      _$this._possibleQuestion2 = possibleQuestion2;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  DevosRecordBuilder() {
    DevosRecord._initializeBuilder(this);
  }

  DevosRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _verseReference = $v.verseReference;
      _date = $v.date;
      _dateString = $v.dateString;
      _photo = $v.photo;
      _catechismTitle = $v.catechismTitle;
      _catechismDetails = $v.catechismDetails;
      _prayerTopic = $v.prayerTopic;
      _prayerDetails = $v.prayerDetails;
      _possibleQuestion1 = $v.possibleQuestion1;
      _possibleQuestion2 = $v.possibleQuestion2;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DevosRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DevosRecord;
  }

  @override
  void update(void Function(DevosRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DevosRecord build() {
    final _$result = _$v ??
        new _$DevosRecord._(
            verseReference: verseReference,
            date: date,
            dateString: dateString,
            photo: photo,
            catechismTitle: catechismTitle,
            catechismDetails: catechismDetails,
            prayerTopic: prayerTopic,
            prayerDetails: prayerDetails,
            possibleQuestion1: possibleQuestion1,
            possibleQuestion2: possibleQuestion2,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
