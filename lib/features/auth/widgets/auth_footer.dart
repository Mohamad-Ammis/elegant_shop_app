import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key,
    required this.title,
    required this.specialWord,
    required this.routePath,
  });
  final String title;
  final String specialWord;
  final String routePath;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textAlign: TextAlign.center,
          title,
          style: Styles.style12Regular.copyWith(color: kSubTitleColor),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(routePath);
          },
          child: Text(
            textAlign: TextAlign.center,
            specialWord,
            style: Styles.style12Bold.copyWith(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
