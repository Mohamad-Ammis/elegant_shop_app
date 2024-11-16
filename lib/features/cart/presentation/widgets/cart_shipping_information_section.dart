// ignore_for_file: use_build_context_synchronously

import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/custom_snack_bar.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/cart_price_cubit/cart_price_cubit.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/get_all_products_cubit/get_all_cart_products_cubit.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/update_cart_products/update_cart_products_cubit.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_shipping_inforamtion_item.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/choose_payment_method_bottom_sheet.dart';
import 'package:elegant_shop_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartShippingInforamtionSection extends StatelessWidget {
  const CartShippingInforamtionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(),
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
                  title:
                      'Total (${context.read<GetAllCartProductsCubit>().cartProducts.length.toString()} items)',
                  subTitle: r'$'
                      "${(context.read<CartPriceCubit>().totalPrice / 100).toStringAsFixed(2)}",
                ),
                12.verticalSizedBox,
                const ShippingInformationItem(
                  title: 'Shipping Fee',
                  subTitle: r'$.0.00',
                ),
                12.verticalSizedBox,
                ShippingInformationItem(
                  title: 'Discount',
                  subTitle: r'$'
                      "${(context.read<CartPriceCubit>().totlaDiscount / 100).toStringAsFixed(2)}",
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
                        "${(context.read<CartPriceCubit>().subTotal / 100).toStringAsFixed(2)}"),
                // const Spacer(),
                16.verticalSizedBox,
                BlocBuilder<UpdateCartProductsCubit, UpdateCartProductsState>(
                  builder: (context, state) {
                    return CustomButton(
                      height: 56,
                      onTap: state is UpdateCartProductsLoading
                          ? null
                          : () async {
                              if (context
                                  .read<GetAllCartProductsCubit>()
                                  .cartProducts
                                  .isEmpty) {
                                showErrorSnackBar('Error Happened',
                                        "Your cart is empty ! ")
                                    .show(context);
                              } else {
                                List<Map<String, dynamic>> data = context
                                    .read<UpdateCartProductsCubit>()
                                    .handleCartProductsAsJson(context
                                        .read<GetAllCartProductsCubit>()
                                        .cartProducts);
                                bool status = await context
                                    .read<UpdateCartProductsCubit>()
                                    .updateCartProducts(
                                        cartProducts: data, context: context);
                                if (status) {
                                  showModalBottomSheet(
                                    backgroundColor: kBackgroundColor,
                                    context: context,
                                    showDragHandle: true,
                                    builder: (context) {
                                      return const ChoosePaymentMethodBottomSheet();
                                    },
                                  );
                                } else {
                                  showErrorSnackBar('Error happened',
                                          "some thing went wrong try again !")
                                      .show(context);
                                }
                              }
                            },
                      color: kLightBlackColor,
                      child: state is UpdateCartProductsLoading
                          ? const CustomLoadingWidget(
                              color: Colors.white,
                              size: 25,
                            )
                          : Text(
                              textAlign: TextAlign.center,
                              'Checkout',
                              style: Styles.style14Bold
                                  .copyWith(color: Colors.white),
                            ),
                    );
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
