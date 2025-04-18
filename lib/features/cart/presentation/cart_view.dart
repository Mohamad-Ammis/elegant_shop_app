import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/widgets/custom_app_bar.dart';
import 'package:elegant_shop_app/core/widgets/custom_error_widget.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/cart_price_cubit/cart_price_cubit.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/get_all_products_cubit/get_all_cart_products_cubit.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<GetAllCartProductsCubit>().getAllCartProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: const CustomAppbar(title: 'Checkout'),
      body: BlocBuilder<GetAllCartProductsCubit, GetAllCartProductsState>(
        builder: (context, state) {
          if (state is GetAllCartProductsSuccess) {
            context
                .read<CartPriceCubit>()
                .calculateCartProcutsPrice(cartProducts: state.cartProducts);
          }
          return state is GetAllCartProductsSuccess
              ? const CartViewBody()
              : state is GetAllCartProductsFailure
                  ? CustomErrorWidget(
                      title: state.errMessage,
                      hasRelodButton: true,
                      onTap: () async {
                        await context
                            .read<GetAllCartProductsCubit>()
                            .getAllCartProducts();
                      },
                    )
                  : const CustomLoadingWidget();
        },
      ),
    );
  }
}
