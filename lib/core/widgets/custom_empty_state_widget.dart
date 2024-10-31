import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomEmptyStateWidget extends StatelessWidget {
  const CustomEmptyStateWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            title,
            style: Styles.style16Regular,
          ),
        )
      ],
    );
  }
}
