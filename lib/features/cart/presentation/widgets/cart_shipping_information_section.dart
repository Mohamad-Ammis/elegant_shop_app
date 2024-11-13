import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/cubit/cart_price_cubit.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_shipping_inforamtion_item.dart';
import 'package:elegant_shop_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartShippingInforamtionSection extends StatelessWidget {
  const CartShippingInforamtionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.white,
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: BlocBuilder<CartPriceCubit, CartPriceState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Shipping Information',
                style: Styles.style14SemiBold,
              ),
              28.verticalSizedBox,
              ShippingInformationItem(
                title: 'Total (9 items)',
                subTitle: r'$'
                    "${context.read<CartPriceCubit>().totalPrice.toStringAsFixed(2)}",
              ),
              12.verticalSizedBox,
              const ShippingInformationItem(
                title: 'Shipping Fee',
                subTitle: r'$.0.00',
              ),
              12.verticalSizedBox,
              const ShippingInformationItem(
                title: 'Discount',
                subTitle: r'$.0.00',
              ),
              12.verticalSizedBox,
              const Divider(
                color: Color(
                  0xffDFDEDE,
                ),
                thickness: 0.3,
                indent: 8,
                endIndent: 8,
              ),
              12.verticalSizedBox,
              ShippingInformationItem(
                  title: 'Sub Total',
                  subTitle: r'$'
                      "${context.read<CartPriceCubit>().totalPrice.toStringAsFixed(2)}"),
              const Spacer(),
              CustomButton(
                color: kLightBlackColor,
                child: Text(
                  textAlign: TextAlign.center,
                  'Checkout',
                  style: Styles.style14Bold.copyWith(color: Colors.white),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
