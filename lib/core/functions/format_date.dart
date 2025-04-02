
  import 'dart:developer';

import 'package:intl/intl.dart';

String formatDate(String date) {
    try {
      DateTime parsedDate = DateTime.parse(date);

      String formattedDate = DateFormat('dd MMM yyyy').format(parsedDate);

      return formattedDate;
    } catch (e) {
      log('Error parsing date: $e');
      return 'Invalid Date';
    }
  }