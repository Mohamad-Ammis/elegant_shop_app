
import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ProductDetailsFloatingBuySection extends StatelessWidget {
  const ProductDetailsFloatingBuySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 30,
      right: 30,
      bottom: 20,
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                width: 200,
                color: kLightBlackColor,
                borderRadius: BorderRadius.circular(16),
                child: Text(
                  textAlign: TextAlign.center,
                  'Buy Now',
                  style: Styles.style18Bold.copyWith(color: Colors.white),
                ),
              ),
            ),

            16.horizontalSizedBox,
            CustomButton(
              width: 60,
              color: kLightBlackColor,
              borderRadius: BorderRadius.circular(16),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
