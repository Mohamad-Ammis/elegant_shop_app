import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/utils/service_locator.dart';
import 'package:elegant_shop_app/features/cart/data/models/cart_product_model/cart_product_model.dart';
import 'package:elegant_shop_app/features/cart/data/repos/cart_repo_implementation.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/get_all_products_cubit/get_all_cart_products_cubit.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_product_card_quantity_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCardQuantitySection extends StatefulWidget {
  const CartProductCardQuantitySection({
    super.key,
    required this.cartProductModel,
  });
  final CartProductModel cartProductModel;
  @override
  State<CartProductCardQuantitySection> createState() =>
      _CartProductCardQuantitySectionState();
}

class _CartProductCardQuantitySectionState
    extends State<CartProductCardQuantitySection> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllCartProductsCubit(
          cartRepo: getIt.get<CartRepoImplementation>()),
      child: Row(
        children: [
          CartProductCardQuantityItem(
            icon: Icons.remove,
            onTap: () {
              if (count > 1) {
                count--;
                setState(() {});
              }
            },
          ),
          12.horizontalSizedBox,
          Text(count.toString()),
          12.horizontalSizedBox,
          CartProductCardQuantityItem(
            icon: Icons.add_rounded,
            onTap: () {
              count++;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
