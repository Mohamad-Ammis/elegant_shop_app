import 'package:flutter/material.dart';

class DrawerModel {
  final String name;
  final String icon;
  final Function() onPressed;

  DrawerModel(
      {required this.name, required this.icon, required this.onPressed});
}
