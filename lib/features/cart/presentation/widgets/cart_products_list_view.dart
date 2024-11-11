import 'package:elegant_shop_app/features/cart/presentation/mangers/cubit/get_all_cart_products_cubit.dart';
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
        return state is GetAllCartProductsSuccess
            ? ListView.separated(
                itemBuilder: (context, index) {
                  return CartProductCard(
                    cartProductModel: state.cartProducts[index],
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
            : SizedBox();
      },
    );
  }
}
