// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommentsRecord> _$commentsRecordSerializer =
    new _$CommentsRecordSerializer();

class _$CommentsRecordSerializer
    implements StructuredSerializer<CommentsRecord> {
  @override
  final Iterable<Type> types = const [CommentsRecord, _$CommentsRecord];
  @override
  final String wireName = 'CommentsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, CommentsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.commentPostedBy;
    if (value != null) {
      result
        ..add('comment_posted_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.comment;
    if (value != null) {
      result
        ..add('comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.commentPostedTime;
    if (value != null) {
      result
        ..add('comment_posted_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  CommentsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommentsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'comment_posted_by':
          result.commentPostedBy = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'comment_posted_time':
          result.commentPostedTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
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

class _$CommentsRecord extends CommentsRecord {
  @override
  final DocumentReference<Object> commentPostedBy;
  @override
  final String comment;
  @override
  final DateTime commentPostedTime;
  @override
  final DocumentReference<Object> reference;

  factory _$CommentsRecord([void Function(CommentsRecordBuilder) updates]) =>
      (new CommentsRecordBuilder()..update(updates)).build();

  _$CommentsRecord._(
      {this.commentPostedBy,
      this.comment,
      this.commentPostedTime,
      this.reference})
      : super._();

  @override
  CommentsRecord rebuild(void Function(CommentsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentsRecordBuilder toBuilder() =>
      new CommentsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentsRecord &&
        commentPostedBy == other.commentPostedBy &&
        comment == other.comment &&
        commentPostedTime == other.commentPostedTime &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, commentPostedBy.hashCode), comment.hashCode),
            commentPostedTime.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CommentsRecord')
          ..add('commentPostedBy', commentPostedBy)
          ..add('comment', comment)
          ..add('commentPostedTime', commentPostedTime)
          ..add('reference', reference))
        .toString();
  }
}

class CommentsRecordBuilder
    implements Builder<CommentsRecord, CommentsRecordBuilder> {
  _$CommentsRecord _$v;

  DocumentReference<Object> _commentPostedBy;
  DocumentReference<Object> get commentPostedBy => _$this._commentPostedBy;
  set commentPostedBy(DocumentReference<Object> commentPostedBy) =>
      _$this._commentPostedBy = commentPostedBy;

  String _comment;
  String get comment => _$this._comment;
  set comment(String comment) => _$this._comment = comment;

  DateTime _commentPostedTime;
  DateTime get commentPostedTime => _$this._commentPostedTime;
  set commentPostedTime(DateTime commentPostedTime) =>
      _$this._commentPostedTime = commentPostedTime;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  CommentsRecordBuilder() {
    CommentsRecord._initializeBuilder(this);
  }

  CommentsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _commentPostedBy = $v.commentPostedBy;
      _comment = $v.comment;
      _commentPostedTime = $v.commentPostedTime;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentsRecord;
  }

  @override
  void update(void Function(CommentsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CommentsRecord build() {
    final _$result = _$v ??
        new _$CommentsRecord._(
            commentPostedBy: commentPostedBy,
            comment: comment,
            commentPostedTime: commentPostedTime,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
