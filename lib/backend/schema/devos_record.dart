import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'devos_record.g.dart';

abstract class DevosRecord implements Built<DevosRecord, DevosRecordBuilder> {
  static Serializer<DevosRecord> get serializer => _$devosRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'verse_reference')
  String get verseReference;

  @nullable
  DateTime get date;

  @nullable
  @BuiltValueField(wireName: 'date_string')
  String get dateString;

  @nullable
  String get photo;

  @nullable
  @BuiltValueField(wireName: 'catechism_title')
  String get catechismTitle;

  @nullable
  @BuiltValueField(wireName: 'catechism_details')
  String get catechismDetails;

  @nullable
  @BuiltValueField(wireName: 'prayer_topic')
  String get prayerTopic;

  @nullable
  @BuiltValueField(wireName: 'prayer_details')
  String get prayerDetails;

  @nullable
  @BuiltValueField(wireName: 'possible_question_1')
  String get possibleQuestion1;

  @nullable
  @BuiltValueField(wireName: 'possible_question_2')
  String get possibleQuestion2;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DevosRecordBuilder builder) => builder
    ..verseReference = ''
    ..dateString = ''
    ..photo = ''
    ..catechismTitle = ''
    ..catechismDetails = ''
    ..prayerTopic = ''
    ..prayerDetails = ''
    ..possibleQuestion1 = ''
    ..possibleQuestion2 = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('devos');

  static Stream<DevosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DevosRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DevosRecord._();
  factory DevosRecord([void Function(DevosRecordBuilder) updates]) =
      _$DevosRecord;

  static DevosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDevosRecordData({
  String verseReference,
  DateTime date,
  String dateString,
  String photo,
  String catechismTitle,
  String catechismDetails,
  String prayerTopic,
  String prayerDetails,
  String possibleQuestion1,
  String possibleQuestion2,
}) =>
    serializers.toFirestore(
        DevosRecord.serializer,
        DevosRecord((d) => d
          ..verseReference = verseReference
          ..date = date
          ..dateString = dateString
          ..photo = photo
          ..catechismTitle = catechismTitle
          ..catechismDetails = catechismDetails
          ..prayerTopic = prayerTopic
          ..prayerDetails = prayerDetails
          ..possibleQuestion1 = possibleQuestion1
          ..possibleQuestion2 = possibleQuestion2));
