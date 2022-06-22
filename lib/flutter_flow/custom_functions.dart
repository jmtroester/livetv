import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

bool checkDate(
  DateTime time1,
  DateTime time2,
) {
  // compare two dates to see if they are the same day
  if (time1.day == time2.day &&
      time1.month == time2.month &&
      time1.year == time2.year) {
    return true;
  }
  return false;
}

String pullDateFromTimeStamp(DateTime timeStamp) {
  // pull date from timestamp
  return DateFormat('MM-dd-yyyy').format(timeStamp).toString();
}

DateTime addADate(DateTime entryDate) {
  // Add a day and keep time the same
  // Adding a day
  if (entryDate.difference(DateTime.now()).inHours < 0) {
    return DateTime.now().add(Duration(days: 1));
  } else {
    return entryDate.add(Duration(days: 1));
  }
}
