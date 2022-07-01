// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bible_verse_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BibleVerseRecord> _$bibleVerseRecordSerializer =
    new _$BibleVerseRecordSerializer();

class _$BibleVerseRecordSerializer
    implements StructuredSerializer<BibleVerseRecord> {
  @override
  final Iterable<Type> types = const [BibleVerseRecord, _$BibleVerseRecord];
  @override
  final String wireName = 'BibleVerseRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, BibleVerseRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.verseNo;
    if (value != null) {
      result
        ..add('verse_no')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.chapterNo;
    if (value != null) {
      result
        ..add('chapter_no')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.bookName;
    if (value != null) {
      result
        ..add('book_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
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
  BibleVerseRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BibleVerseRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'verse_no':
          result.verseNo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'chapter_no':
          result.chapterNo = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'book_name':
          result.bookName = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
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

class _$BibleVerseRecord extends BibleVerseRecord {
  @override
  final String verseNo;
  @override
  final DocumentReference<Object> chapterNo;
  @override
  final DocumentReference<Object> bookName;
  @override
  final DocumentReference<Object> reference;

  factory _$BibleVerseRecord(
          [void Function(BibleVerseRecordBuilder) updates]) =>
      (new BibleVerseRecordBuilder()..update(updates)).build();

  _$BibleVerseRecord._(
      {this.verseNo, this.chapterNo, this.bookName, this.reference})
      : super._();

  @override
  BibleVerseRecord rebuild(void Function(BibleVerseRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BibleVerseRecordBuilder toBuilder() =>
      new BibleVerseRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BibleVerseRecord &&
        verseNo == other.verseNo &&
        chapterNo == other.chapterNo &&
        bookName == other.bookName &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, verseNo.hashCode), chapterNo.hashCode),
            bookName.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BibleVerseRecord')
          ..add('verseNo', verseNo)
          ..add('chapterNo', chapterNo)
          ..add('bookName', bookName)
          ..add('reference', reference))
        .toString();
  }
}

class BibleVerseRecordBuilder
    implements Builder<BibleVerseRecord, BibleVerseRecordBuilder> {
  _$BibleVerseRecord _$v;

  String _verseNo;
  String get verseNo => _$this._verseNo;
  set verseNo(String verseNo) => _$this._verseNo = verseNo;

  DocumentReference<Object> _chapterNo;
  DocumentReference<Object> get chapterNo => _$this._chapterNo;
  set chapterNo(DocumentReference<Object> chapterNo) =>
      _$this._chapterNo = chapterNo;

  DocumentReference<Object> _bookName;
  DocumentReference<Object> get bookName => _$this._bookName;
  set bookName(DocumentReference<Object> bookName) =>
      _$this._bookName = bookName;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  BibleVerseRecordBuilder() {
    BibleVerseRecord._initializeBuilder(this);
  }

  BibleVerseRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _verseNo = $v.verseNo;
      _chapterNo = $v.chapterNo;
      _bookName = $v.bookName;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BibleVerseRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BibleVerseRecord;
  }

  @override
  void update(void Function(BibleVerseRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BibleVerseRecord build() {
    final _$result = _$v ??
        new _$BibleVerseRecord._(
            verseNo: verseNo,
            chapterNo: chapterNo,
            bookName: bookName,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
