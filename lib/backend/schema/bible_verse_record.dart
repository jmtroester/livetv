import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'bible_verse_record.g.dart';

abstract class BibleVerseRecord
    implements Built<BibleVerseRecord, BibleVerseRecordBuilder> {
  static Serializer<BibleVerseRecord> get serializer =>
      _$bibleVerseRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'verse_no')
  String get verseNo;

  @nullable
  @BuiltValueField(wireName: 'chapter_no')
  DocumentReference get chapterNo;

  @nullable
  @BuiltValueField(wireName: 'book_name')
  DocumentReference get bookName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BibleVerseRecordBuilder builder) =>
      builder..verseNo = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bible_verse');

  static Stream<BibleVerseRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BibleVerseRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BibleVerseRecord._();
  factory BibleVerseRecord([void Function(BibleVerseRecordBuilder) updates]) =
      _$BibleVerseRecord;

  static BibleVerseRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBibleVerseRecordData({
  String verseNo,
  DocumentReference chapterNo,
  DocumentReference bookName,
}) =>
    serializers.toFirestore(
        BibleVerseRecord.serializer,
        BibleVerseRecord((b) => b
          ..verseNo = verseNo
          ..chapterNo = chapterNo
          ..bookName = bookName));
