import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailsReviewRating extends StatelessWidget {
  const ProductDetailsReviewRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.imagesStar,
        ),
        SvgPicture.asset(
          Assets.imagesStar,
        ),
        SvgPicture.asset(
          Assets.imagesStar,
        ),
        SvgPicture.asset(
          Assets.imagesStar,
        ),
        SvgPicture.asset(
          Assets.imagesStar,
          colorFilter: const ColorFilter.mode(
            Colors.grey,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }
}
