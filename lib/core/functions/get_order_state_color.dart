import 'package:flutter/material.dart';

Color getOrderStateColor(String state) {
  switch (state) {
    case 'pending':
      return Colors.blue;
    case 'paid':
    case 'completed ':
      return Colors.green;
    case 'shipping':
      return Colors.pink;
    case 'processing':
      return Colors.deepPurple;
    case 'refunded':
    case 'partial_refund':
    case 'cancelled':
      return Colors.red;
    default:
      return Colors.black;
  }
}
