import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class GetBibleVerseCall {
  static Future<ApiCallResponse> call({
    String q = '',
    bool includeShortCopyright,
    bool includePassageReferences,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Bible Verse',
      apiUrl: 'https://api.esv.org/v3/passage/text/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Token d0f3c06eb7a47ec198359c3429a0f288fff342a7',
      },
      params: {
        'q': q,
        'include-short-copyright': includeShortCopyright,
        'include-passage-references': includePassageReferences,
      },
      returnBody: true,
    );
  }

  static dynamic passage(dynamic response) => getJsonField(
        response,
        r'''$.passages''',
      );
  static dynamic verseReference(dynamic response) => getJsonField(
        response,
        r'''$.query''',
      );
  static dynamic prevChapter(dynamic response) => getJsonField(
        response,
        r'''$.passage_meta[:].prev_chapter''',
      );
  static dynamic nextChapter(dynamic response) => getJsonField(
        response,
        r'''$.passage_meta[:].next_chapter''',
      );
  static dynamic parsed(dynamic response) => getJsonField(
        response,
        r'''$.parsed''',
      );
  static dynamic prevVerse(dynamic response) => getJsonField(
        response,
        r'''$.passage_meta[:].next_verse''',
      );
  static dynamic nextVerse(dynamic response) => getJsonField(
        response,
        r'''$.passage_meta[:].next_verse''',
      );
}

class GetBibleBooksCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Bible Books',
      apiUrl:
          'https://api.scripture.api.bible/v1/bibles/06125adad2d5898a-01/books',
      callType: ApiCallType.GET,
      headers: {
        'api-key': 'a2e97cb3ad20b17701d8bc592679248d',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic books(dynamic response) => getJsonField(
        response,
        r'''$.data[:].bibleId''',
      );
  static dynamic bookId(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
      );
  static dynamic bookName(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
      );
}

class GetBibleChaptersCall {
  static Future<ApiCallResponse> call({
    String bookId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Bible Chapters',
      apiUrl:
          'https://api.scripture.api.bible/v1/bibles/06125adad2d5898a-01/books/${bookId}/chapters',
      callType: ApiCallType.GET,
      headers: {
        'api-key': 'a2e97cb3ad20b17701d8bc592679248d',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic chapterNo(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
      );
  static dynamic chapterReference(dynamic response) => getJsonField(
        response,
        r'''$.data[:].reference''',
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
      );
}

class GetBibleVerseNumbersCall {
  static Future<ApiCallResponse> call({
    String chapterId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Bible Verse Numbers',
      apiUrl:
          'https://api.scripture.api.bible/v1/bibles/06125adad2d5898a-01/chapters/${chapterId}/verses',
      callType: ApiCallType.GET,
      headers: {
        'api-key': 'a2e97cb3ad20b17701d8bc592679248d',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic verseId(dynamic response) => getJsonField(
        response,
        r'''$.data[:].reference''',
      );
  static dynamic verseReference(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
      );
}

class FullSermonsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Full Sermons',
      apiUrl: 'https://api.flotiq.com/api/v1/content/livetv_app',
      callType: ApiCallType.GET,
      headers: {
        'X-AUTH-TOKEN': '8a014de7689639834d2fe0b256433523',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic videoID(dynamic response) => getJsonField(
        response,
        r'''$.data[:].sermon_thumbnail[:].dataUrl''',
      );
  static dynamic text(dynamic response) => getJsonField(
        response,
        r'''$.data[:].text''',
      );
  static dynamic audioLink(dynamic response) => getJsonField(
        response,
        r'''$.data[:].audio_link''',
      );
  static dynamic videoLink(dynamic response) => getJsonField(
        response,
        r'''$.data[:].video_link''',
      );
  static dynamic sermonName(dynamic response) => getJsonField(
        response,
        r'''$.data[:].sermon_name''',
      );
  static dynamic sermonThumbnail(dynamic response) => getJsonField(
        response,
        r'''$.data[:].sermon_thumbnail[:].dataUrl''',
      );
}
