import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
    this.color = Colors.black,
    this.size,
  });
  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCircle(
        size: size ?? 50,
        color: color,
      ),
    );
  }
}
