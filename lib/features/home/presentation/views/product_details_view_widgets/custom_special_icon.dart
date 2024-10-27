
import 'package:flutter/material.dart';

class CustomSpecialIcon extends StatelessWidget {
  const CustomSpecialIcon({
    super.key,
    required this.icon,
    required this.alignment,
  });
  final Icon icon;
  final Alignment alignment;
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Align(
      alignment: alignment,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          // height: 45,
          // width: 45,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(999),
          ),
          child: icon),
    ));
  }
}
