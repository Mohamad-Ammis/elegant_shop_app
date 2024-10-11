import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.width,
      this.height,
      required this.child,
      this.color,
      this.borderRadius,
      this.padding, this.onTap});
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.all(16),
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: color ?? Colors.black,
          borderRadius: borderRadius ?? BorderRadius.circular(16),
        ),
        child: child,
      ),
    );
  }
}
