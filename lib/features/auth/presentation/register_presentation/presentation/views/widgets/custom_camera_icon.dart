import 'package:flutter/material.dart';

class CustomCameraIcon extends StatelessWidget {
  const CustomCameraIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                ))));
  }
}
