import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          width: 60,
          height: 60,
          clipBehavior: Clip.hardEdge,
          transformAlignment: AlignmentDirectional.center,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              border: Border.all(width: .1, color: kSubTitleColor)),
          duration: const Duration(milliseconds: 300),
          child: Image.asset(
            Assets.imagesPers,
            fit: BoxFit.cover,
          ),
        ),
        4.verticalSizedBox,
        Center(
          child: SizedBox(
            width: 60,
            child: Text(
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              title,
              style: Styles.style12Regular,
            ),
          ),
        ),
      ],
    );
  }
}
