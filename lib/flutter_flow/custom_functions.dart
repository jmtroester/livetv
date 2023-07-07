import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? checkDate(
  DateTime? time1,
  DateTime? time2,
) {
  // compare two dates to see if they are the same day
  if (time1!.day == time2!.day &&
      time1.month == time2.month &&
      time1.year == time2.year) {
    return true;
  }
  return false;
}

bool? checkDateSAFE(
  DateTime? time1,
  DateTime? time2,
) {
  // compare two dates to see if they are the same day
  if (time1 == null) return time2 == null;

  // Check if year, month, day is the same
  if (time1?.year != time2?.year) return false;
  if (time1?.month != time2?.month) return false;
  if (time1?.day != time2?.day) return false;
  return true;
}

String pullDateFromTimeStamp(DateTime? timeStamp) {
  // pull date from timestamp
  return DateFormat('MM-dd-yyyy').format(timeStamp!).toString();
}

String pullDateFromTimeStampSAFE(DateTime? timeStamp) {
  // pull date from timestamp
  String year = '${timeStamp?.year}';
  String month = '${timeStamp?.month}';
  String day = '${timeStamp?.day}';
  return '$day.$month.$year';
}

DateTime addADate(DateTime? entryDate) {
  // Add a day and keep time the same
  // Adding a day
  if (entryDate!.difference(DateTime.now()).inHours < 0) {
    return DateTime.now().add(Duration(days: 1));
  } else {
    return entryDate.add(Duration(days: 1));
  }
}

String alterURL(String? inputURL) {
  // Remove everything before the phrase _media/
  final index = inputURL!.indexOf('_media-');
  return inputURL.replaceRange(0, index, '');
}

double calcPercentage(
  int? inputStart,
  int? points,
) {
  // point minus inputStart then divide by 100
  return ((points! - inputStart!) / 100).abs();
}

int removeLastTwoDigits(int? inputNo) {
  // remove last two numbers
  return inputNo! ~/ 100;
}

int keepLastTwo(int? inputNo) {
  // pull the last two numbers
  var noAsString = inputNo.toString();
  var newNo =
      int.parse(noAsString.substring(noAsString.length - 2, noAsString.length));
  return newNo;
}

double convertToPercentage(int? inputNo) {
  // multiple integer by .01
  return (inputNo! * 0.01);
}

int subtract90(int? inputNo) {
  // subtract 90 from the input number
  return inputNo! - 90;
}

int subtractTwoInputs(
  int? inputOne,
  int? inputTwo,
) {
  // substract two numbers
  return inputOne! - inputTwo! + 1;
}

String removeAfterSpace(String? inputString) {
  // remove everything after the first space
  return inputString!.split(' ').getRange(0, 1).join(' ');
}

List<int> getNumbersforChapterCount(int? max) {
  // count up to max
  return List<int>.generate(
    max!,
    (index) => index + 1,
  );
}

int convertStringtoInteger(String? stringToConvert) {
  // convert string to integer
  int convertedInteger = 0;
  if (stringToConvert != null) {
    convertedInteger = int.parse(stringToConvert);
  }
  return convertedInteger;
}

String createThreeDigitVerseId(int? input) {
  // if number has less than 3 digits put zero in front
  if (input! < 10) {
    return '00$input';
  } else if (input < 100) {
    return '0$input';
  } else {
    return '$input';
  }
}

String threeDigitVerseIDforString(String? input) {
  // if string has less than three digits put zeros in front
  if (input!.length == 1) {
    return '00' + input;
  } else if (input.length == 2) {
    return '0' + input;
  }
  return input;
}

String twoDigitBookIDforString(String? input) {
  // if input is less than two digits add zeros in front
  if (input!.length <= 1) return '0$input';

  return input;
}

String removeExtraHTML(String? hTMLinput) {
  // remove all instances of /n in the string
  return hTMLinput!.replaceAll("/n", "");
}

String parsedVerseIDs(String? inputVerseIDs) {
  // replace comma and space with a dash and remove all brackets
  return inputVerseIDs!
      .replaceAll(', ', '-')
      .replaceAll('[', '')
      .replaceAll(']', '');
}

String removeSpacesFromPassage(String? passageInput) {
  // remove all instance of "\" from string
  passageInput ??= "";
  passageInput = passageInput.replaceAll("\n", "");
  passageInput = passageInput.replaceAll(",", "");
  passageInput = passageInput.replaceAll("  ", " ");
  passageInput = passageInput.replaceAll(" ", " ");
  passageInput = passageInput.replaceAll("⏎", "");
  passageInput = passageInput.replaceAll("\\", "");
  return passageInput;
}

String removeSpacesFromPassageCopy(String? passageInput) {
  // remove all instances of "\" then remove "nn" from string
  passageInput = passageInput ?? '';
  passageInput = passageInput.replaceAll("\n\n", "");
  passageInput = passageInput.replaceAll('[ ', "");
  passageInput = passageInput.replaceAll('(ESV', "");
  return passageInput.substring(0, passageInput.length - 2);
}

int subtract1(int? input) {
  // subtract 1 from input
  return input! - 1;
}

bool checkToSeeIfDateIsBehindAnother(
  DateTime? date1,
  DateTime? date2,
) {
  // check to see if date1 comes before date2
  if (date1 == null) {
    return false;
  }
  if (date2 == null) {
    return true;
  }
  return date1.isBefore(date2);
}

int addFourIntegers(
  int? shorts,
  int? sermons,
  int? audio,
  int? podcast,
) {
  // add four numbers together
  return (shorts ?? 0) + (sermons ?? 0) + (audio ?? 0) + (podcast ?? 0);
}

int wowThisIsComplicated(
  int? shorts,
  int? sermons,
  int? shortsUser,
  int? sermonsUser,
) {
  // add four numbers together
  return ((shorts ?? 0) + (sermons ?? 0)) -
      ((shortsUser ?? 0) + (sermonsUser ?? 0)) +
      (2);
}

int subtractTwoNumbers(
  int? input1,
  int? input2,
) {
  // subtract two numbers
  if (input1 == null || input2 == null) {
    return 0;
  } else {
    return input1 - input2;
  }
}

DateTime? add14Days(DateTime? inputDate) {
  // add 14 days to date
  if (inputDate == null) {
    return null;
  }
  var milliSeconds = inputDate.millisecondsSinceEpoch;
  milliSeconds += 1209600000;
  inputDate = DateTime.fromMillisecondsSinceEpoch(milliSeconds);
  return inputDate;
}

String getPlaybackIdFromUrl(String url) {
  String str1 = url.replaceAll(".m3u8", "");
  return str1.split("/").last;
}

String createUrlFromPlaybackId(String playbackId) {
  return 'https://stream.mux.com/$playbackId.m3u8';
}
