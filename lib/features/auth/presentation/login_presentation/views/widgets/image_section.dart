import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class LoginImageSection extends StatelessWidget {
  const LoginImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            colorFilter: ColorFilter.srgbToLinearGamma(),
            image: AssetImage(
              Assets.imagesLogin,
            ),
            fit: BoxFit.cover),
      ),
    );
  }
}
