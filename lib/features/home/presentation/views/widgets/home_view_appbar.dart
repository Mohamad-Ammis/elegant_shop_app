
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/home_view_app_bar_image.dart';
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
        GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
            ),
            width: 50,
            height: 50,
            child: const HomeViewAppBarImage(),
          ),
        ),
      ],
    );
  }
}
