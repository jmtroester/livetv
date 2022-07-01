import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'levels_record.g.dart';

abstract class LevelsRecord
    implements Built<LevelsRecord, LevelsRecordBuilder> {
  static Serializer<LevelsRecord> get serializer => _$levelsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'level_id')
  int get levelId;

  @nullable
  @BuiltValueField(wireName: 'level_image')
  String get levelImage;

  @nullable
  @BuiltValueField(wireName: 'min_points')
  int get minPoints;

  @nullable
  @BuiltValueField(wireName: 'max_points')
  int get maxPoints;

  @nullable
  BuiltList<DocumentReference> get user;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(LevelsRecordBuilder builder) => builder
    ..levelId = 0
    ..levelImage = ''
    ..minPoints = 0
    ..maxPoints = 0
    ..user = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('levels');

  static Stream<LevelsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<LevelsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  LevelsRecord._();
  factory LevelsRecord([void Function(LevelsRecordBuilder) updates]) =
      _$LevelsRecord;

  static LevelsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createLevelsRecordData({
  int levelId,
  String levelImage,
  int minPoints,
  int maxPoints,
}) =>
    serializers.toFirestore(
        LevelsRecord.serializer,
        LevelsRecord((l) => l
          ..levelId = levelId
          ..levelImage = levelImage
          ..minPoints = minPoints
          ..maxPoints = maxPoints
          ..user = null));
