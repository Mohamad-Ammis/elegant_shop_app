import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/features/cart/data/models/cart_product_model/cart_product_model.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/delete_cart_product_cubit/delete_cart_product_cubit.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/get_all_products_cubit/get_all_cart_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCardInfoHeader extends StatelessWidget {
  const CartProductCardInfoHeader({
    super.key,
    required this.cartProductModel,
  });
  final CartProductModel cartProductModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width / 2.5,
          child: Text(
            overflow: TextOverflow.ellipsis,
            cartProductModel.product!.name ?? '',
            style: Styles.style14SemiBold,
          ),
        ),
        BlocBuilder<DeleteCartProductCubit, DeleteCartProductState>(
          builder: (context, state) {
            return GestureDetector(
              onTapDown: (TapDownDetails details) {
                showMenu(
                  menuPadding: const EdgeInsets.all(0),
                  color: Colors.white,
                  context: context,
                  position: RelativeRect.fromLTRB(
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                  ),
                  items: [
                    PopupMenuItem(
                      onTap: state is DeleteCartProductLoading
                          ? null
                          : () async {
                              bool status = await context
                                  .read<DeleteCartProductCubit>()
                                  .deleteCartProduct(
                                      productId: cartProductModel.id.toString(),
                                      context: context);
                              if (status) {
                                // ignore: use_build_context_synchronously
                                await context
                                    .read<GetAllCartProductsCubit>()
                                    .getAllCartProducts();
                              }
                            },
                      child: state is DeleteCartProductLoading
                          ? const CircularProgressIndicator()
                          : Row(
                              children: [
                                const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Delete',
                                  style: Styles.style14Bold,
                                ),
                              ],
                            ),
                    ),
                    // يمكنك إضافة خيارات إضافية هنا
                  ],
                );
              },
              child: const Icon(Icons.more_horiz),
            );
          },
        ), // const Icon(Icons.more_horiz)
      ],
    );
  }
}
