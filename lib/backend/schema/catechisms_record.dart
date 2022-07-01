import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'catechisms_record.g.dart';

abstract class CatechismsRecord
    implements Built<CatechismsRecord, CatechismsRecordBuilder> {
  static Serializer<CatechismsRecord> get serializer =>
      _$catechismsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'catechism_id')
  int get catechismId;

  @nullable
  String get question;

  @nullable
  String get answer;

  @nullable
  String get verse1;

  @nullable
  String get verse2;

  @nullable
  String get verse3;

  @nullable
  String get image;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CatechismsRecordBuilder builder) => builder
    ..catechismId = 0
    ..question = ''
    ..answer = ''
    ..verse1 = ''
    ..verse2 = ''
    ..verse3 = ''
    ..image = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('catechisms');

  static Stream<CatechismsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CatechismsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CatechismsRecord._();
  factory CatechismsRecord([void Function(CatechismsRecordBuilder) updates]) =
      _$CatechismsRecord;

  static CatechismsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCatechismsRecordData({
  int catechismId,
  String question,
  String answer,
  String verse1,
  String verse2,
  String verse3,
  String image,
}) =>
    serializers.toFirestore(
        CatechismsRecord.serializer,
        CatechismsRecord((c) => c
          ..catechismId = catechismId
          ..question = question
          ..answer = answer
          ..verse1 = verse1
          ..verse2 = verse2
          ..verse3 = verse3
          ..image = image));
