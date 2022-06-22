import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'misc_record.g.dart';

abstract class MiscRecord implements Built<MiscRecord, MiscRecordBuilder> {
  static Serializer<MiscRecord> get serializer => _$miscRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'home_image')
  String get homeImage;

  @nullable
  @BuiltValueField(wireName: 'home_text')
  String get homeText;

  @nullable
  @BuiltValueField(wireName: 'home_image_link')
  String get homeImageLink;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MiscRecordBuilder builder) => builder
    ..homeImage = ''
    ..homeText = ''
    ..homeImageLink = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('misc');

  static Stream<MiscRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MiscRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MiscRecord._();
  factory MiscRecord([void Function(MiscRecordBuilder) updates]) = _$MiscRecord;

  static MiscRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMiscRecordData({
  String homeImage,
  String homeText,
  String homeImageLink,
}) =>
    serializers.toFirestore(
        MiscRecord.serializer,
        MiscRecord((m) => m
          ..homeImage = homeImage
          ..homeText = homeText
          ..homeImageLink = homeImageLink));
