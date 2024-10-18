
import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.isActive,
    required this.title,
  });
  final bool isActive;
  final String title;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transformAlignment: AlignmentDirectional.center,
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : null,
        borderRadius: BorderRadius.circular(8),
        border: isActive ? null : Border.all(width: 0.1, color: kSubTitleColor),
      ),
      duration: Duration(milliseconds: 300),
      child: Center(
        child: Text(
          title,
          style: isActive
              ? Styles.style12Bold.copyWith(color: Colors.white)
              : Styles.style12Medium,
        ),
      ),
    );
  }
}
