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
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int daysRemaining(DateTime endDate) {
  // Get the current date
  DateTime currentDate = DateTime.now();

  // Calculate the difference in days
  int difference = endDate.difference(currentDate).inDays;

  // Ensure it doesn't return negative values
  return difference > 0 ? difference : 0;
}

double newCustomFunction(
  double targetAmount,
  double amountRaised,
) {
  if (targetAmount == 0) {
    return 0.0;
  }

  // Calculate progress
  double progress = amountRaised / targetAmount;

  // Cap the progress at 1
  return progress > 1 ? 1.0 : progress;
}
