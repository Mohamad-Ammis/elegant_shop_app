
import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_shipping_inforamtion_item.dart';
import 'package:elegant_shop_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CartShippingInforamtionSection extends StatelessWidget {
  const CartShippingInforamtionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.white,
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Shipping Information',
            style: Styles.style14SemiBold,
          ),
          28.verticalSizedBox,
          ShippingInformationItem(
            title: 'Total (9 items)',
            subTitle: r'$1,014.95',
          ),
          12.verticalSizedBox,
          ShippingInformationItem(
            title: 'Shipping Fee',
            subTitle: r'$.0.00',
          ),
          12.verticalSizedBox,
          ShippingInformationItem(
            title: 'Discount',
            subTitle: r'$.0.00',
          ),
          12.verticalSizedBox,
          Divider(
            color: Color(
              0xffDFDEDE,
            ),
            thickness: 0.3,
            indent: 8,
            endIndent: 8,
          ),
          12.verticalSizedBox,
          ShippingInformationItem(
              title: 'Sub Total', subTitle: r'$1,014.95'),
          Spacer(),
          CustomButton(
            child: Text(
              textAlign: TextAlign.center,
              'Checkout',
              style: Styles.style14Bold.copyWith(color: Colors.white),
            ),
            color: kLightBlackColor,
          )
        ],
      ),
    );
  }
}
