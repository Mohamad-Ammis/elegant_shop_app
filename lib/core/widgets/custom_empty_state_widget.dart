import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomEmptyStateWidget extends StatelessWidget {
  const CustomEmptyStateWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LottieBuilder.asset('assets/lottie/empty.json',
            height: 200, fit: BoxFit.contain),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            title,
            style: Styles.style16Regular,
          ),
        )
      ],
    );
  }
}
