import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {super.key, required this.title, this.hasAnimation = true});
  final String title;
  final bool hasAnimation;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (hasAnimation)
          Lottie.asset('assets/lottie/error.json',
              height: 200, fit: BoxFit.contain),
        Center(
          child: Text(
            title,
            style: Styles.style14Regular,
          ),
        ),
      ],
    );
  }
}
