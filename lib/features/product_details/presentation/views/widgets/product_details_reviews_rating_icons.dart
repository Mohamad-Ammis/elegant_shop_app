import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailsReviewRating extends StatelessWidget {
  const ProductDetailsReviewRating({
    super.key,
    required this.count,
  });
  final int count;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return SvgPicture.asset(
              Assets.imagesStar,
              colorFilter: index + 1 > count
                  ? ColorFilter.mode(
                      Colors.grey.withOpacity(.5), BlendMode.srcIn)
                  : null,
            );
          }),
    );
  }
}
