import 'dart:io';

import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/main.dart';
import 'package:flutter/material.dart';

class HomeViewAppbar extends StatelessWidget {
  const HomeViewAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello,Welcome👋',
              style: Styles.style12Regular,
            ),
            Text(
              userInfo.getString('user_name').toString(),
              style: Styles.style18Bold,
            ),
          ],
        ),
        Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 24,
            backgroundImage: (userInfo.getString('profile_image') != null &&
                    userInfo.getString('profile_image').toString().isNotEmpty)
                ? FileImage(
                    File(userInfo.getString('profile_image').toString()))
                : const AssetImage(Assets.imagesPers),
          ),
        ),
      ],
    );
  }
}
