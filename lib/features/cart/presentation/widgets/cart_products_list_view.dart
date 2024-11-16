import 'package:elegant_shop_app/core/widgets/custom_empty_state_widget.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/get_all_products_cubit/get_all_cart_products_cubit.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductsListView extends StatelessWidget {
  const CartProductsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCartProductsCubit, GetAllCartProductsState>(
      builder: (context, state) {
        // if (state is GetAllCartProductsSuccess) {
        //   log(context
        //       .read<GetAllCartProductsCubit>()
        //       .calculatePrice(state.cartProducts)
        //       .toString());
        // }
        return state is GetAllCartProductsSuccess
            ? state.cartProducts.isNotEmpty
                ? ListView.separated(
                    cacheExtent: 10,
                    itemBuilder: (context, index) {
                      return CartProductCard(
                        cartProductModel: state.cartProducts[index],
                        cartProductModelIndex: index,
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                          color: Color(
                            0xffDFDEDE,
                          ),
                          thickness: 0.3,
                          indent: 10,
                          endIndent: 10,
                        ),
                    itemCount: state.cartProducts.length)
                : CustomEmptyStateWidget(
                    title: 'Sorry you dont have any products here')
            : const SizedBox();
      },
    );
  }
}
