
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios)),
      title: Text(
        title,
        style: Styles.style16SemiBold,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
