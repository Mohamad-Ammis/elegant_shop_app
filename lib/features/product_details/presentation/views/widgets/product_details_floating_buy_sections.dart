import 'dart:developer';

import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/custom_snack_bar.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/cubit/add_to_cart_cubit.dart';
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
            BlocBuilder<AddToCartCubit, AddToCartState>(
              builder: (context, state) {
                return CustomButton(
                  onTap: state is AddToCartLoading
                      ? null
                      : () {
                          log('productDetailsModel.inStock: ${productDetailsModel.inStock}');
                          if (!(productDetailsModel.inStock ?? true)) {
                            showErrorSnackBar('Sorry',
                                    "this product is out of stock right now")
                                .show(context);
                          } else {
                            context.read<AddToCartCubit>().addProductToCart(
                                productId: productDetailsModel.id.toString(),
                                productQuantity: "10000",
                                context: context);
                          }
                        },
                  width: 60,
                  height: 56,
                  color: kLightBlackColor,
                  borderRadius: BorderRadius.circular(16),
                  child: state is AddToCartLoading
                      ? const CustomLoadingWidget(
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
