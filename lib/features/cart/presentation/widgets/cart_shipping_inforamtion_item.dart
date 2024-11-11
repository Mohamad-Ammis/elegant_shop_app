import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ShippingInformationItem extends StatelessWidget {
  const ShippingInformationItem({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styles.style14Regular,
        ),
        Text(
          subTitle,
          style: Styles.style14SemiBold,
        )
      ],
    );
  }
}
