import 'package:flutter/material.dart';

class CustomSpecialIcon extends StatelessWidget {
  const CustomSpecialIcon({
    super.key,
    required this.icon,
    required this.alignment,
    this.onTap,
  });
  final Widget icon;
  final Alignment alignment;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Align(
      alignment: alignment,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            // height: 45,
            // width: 45,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(999),
            ),
            child: icon),
      ),
    ));
  }
}
