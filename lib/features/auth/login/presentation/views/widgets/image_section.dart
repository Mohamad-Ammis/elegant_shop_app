
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height / 3 + 50,
        decoration: const BoxDecoration(
          image: DecorationImage(
              colorFilter:  ColorFilter.srgbToLinearGamma(),
              image: AssetImage(
                Assets.imagesLogin,
              ),
              fit: BoxFit.cover),
          color: Color(0xff8E6CEF),
        ),
      ),
    );
  }
}
