import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'bible_books_record.g.dart';

abstract class BibleBooksRecord
    implements Built<BibleBooksRecord, BibleBooksRecordBuilder> {
  static Serializer<BibleBooksRecord> get serializer =>
      _$bibleBooksRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'book_name')
  String get bookName;

  @nullable
  @BuiltValueField(wireName: 'chapter_no')
  BuiltList<int> get chapterNo;

  @nullable
  @BuiltValueField(wireName: 'verse_no')
  BuiltList<int> get verseNo;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BibleBooksRecordBuilder builder) => builder
    ..bookName = ''
    ..chapterNo = ListBuilder()
    ..verseNo = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bible_books');

  static Stream<BibleBooksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BibleBooksRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BibleBooksRecord._();
  factory BibleBooksRecord([void Function(BibleBooksRecordBuilder) updates]) =
      _$BibleBooksRecord;

  static BibleBooksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBibleBooksRecordData({
  String bookName,
}) =>
    serializers.toFirestore(
        BibleBooksRecord.serializer,
        BibleBooksRecord((b) => b
          ..bookName = bookName
          ..chapterNo = null
          ..verseNo = null));
