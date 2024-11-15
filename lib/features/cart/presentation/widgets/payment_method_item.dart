import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/features/cart/data/models/payment_method_item_model.dart';
import 'package:flutter/material.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.model,
    required this.isSelected,
  });
  final PaymentMethodItemModel model;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
          color: kLightGreyColor,
          border: Border.all(
            color: isSelected ? kLightBlackColor : kLightGreyColor,
          ),
          borderRadius: BorderRadius.circular(16)
          // border: Border.all(color: kPrimaryColor)
          ),
      duration: const Duration(milliseconds: 600),
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Image.asset(model.image),
        ),
        title: Text(
          model.title,
          style: Styles.style16Regular,
        ),
      ),
    );
  }
}
