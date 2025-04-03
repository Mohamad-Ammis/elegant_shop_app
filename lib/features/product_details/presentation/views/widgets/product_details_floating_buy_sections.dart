import 'dart:developer';

import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/custom_snack_bar.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:elegant_shop_app/features/product_details/data/models/product_details_model/product_details_model.dart';
import 'package:elegant_shop_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsFloatingBuySection extends StatelessWidget {
  const ProductDetailsFloatingBuySection({
    super.key,
    required this.productDetailsModel,
  });
  final ProductDetailsModel productDetailsModel;
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
              child: BlocBuilder<AddToCartCubit, AddToCartState>(
                builder: (context, state) {
                  return CustomButton(
                      onTap: state is AddToCartLoading
                          ? null
                          : () {
                              log('productDetailsModel.inStock: ${productDetailsModel.inStock}');
                              if (!(productDetailsModel.inStock ?? true)) {
                                ElegantNotificationService.showErrorSnackBar('Sorry',
                                        "this product is out of stock right now")
                                    ;
                              } else {
                                context.read<AddToCartCubit>().addProductToCart(
                                    productId:
                                        productDetailsModel.id.toString(),
                                    productQuantity: "1",
                                    context: context);
                              }
                            },
                      width: 60,
                      height: 56,
                      color: kLightBlackColor,
                      borderRadius: BorderRadius.circular(16),
                      child: state is AddToCartLoading
                          ? const CustomLoadingWidget(
                              size: 25,
                              color: Colors.white,
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Spacer(),
                                Text(
                                  textAlign: TextAlign.center,
                                  "Add to cart",
                                  style: Styles.style18Bold
                                      .copyWith(color: Colors.white),
                                ),
                                const Spacer(),
                                16.horizontalSizedBox,
                                const Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.white,
                                )
                              ],
                            ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
