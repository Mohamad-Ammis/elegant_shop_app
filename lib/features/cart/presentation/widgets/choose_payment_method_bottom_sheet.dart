import 'dart:developer';

import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/app_routes.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/custom_snack_bar.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/utils/service_locator.dart';
import 'package:elegant_shop_app/core/utils/stripe_service.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/cart/data/models/payment_method_item_model.dart';
import 'package:elegant_shop_app/features/cart/data/repos/cart_repo_implementation.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/cubit/create_order_cubit.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/get_all_products_cubit/get_all_cart_products_cubit.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/update_cart_products/update_cart_products_cubit.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/helper.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/payment_method_item.dart';
import 'package:elegant_shop_app/features/orders/data/models/order_model/order_model.dart';
import 'package:elegant_shop_app/main.dart';
import 'package:elegant_shop_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChoosePaymentMethodBottomSheet extends StatefulWidget {
  const ChoosePaymentMethodBottomSheet({
    super.key,
  });

  @override
  State<ChoosePaymentMethodBottomSheet> createState() =>
      _ChoosePaymentMethodBottomSheetState();
}

class _ChoosePaymentMethodBottomSheetState
    extends State<ChoosePaymentMethodBottomSheet> {
  int selectedIndex = 0;
  List<PaymentMethodItemModel> items = [
    PaymentMethodItemModel(title: 'Cash', image: Assets.imagesCashOnDelivery),
    PaymentMethodItemModel(
        title: 'Credit Card', image: Assets.imagesCreditCard),
  ];
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CreateOrderCubit(cartRepo: getIt.get<CartRepoImplementation>()),
        ),
        BlocProvider(
          create: (context) => GetAllCartProductsCubit(
              cartRepo: getIt.get<CartRepoImplementation>()),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kMainPagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Please choose your payment method ',
              style: Styles.style14Regular,
            ),
            8.verticalSizedBox,
            SizedBox(
              height: 150,
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        selectedIndex = index;
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: PaymentMethodItem(
                          model: items[index],
                          isSelected: selectedIndex == index,
                        ),
                      ),
                    );
                  }),
            ),
            16.verticalSizedBox,
            BlocBuilder<CreateOrderCubit, CreateOrderState>(
              builder: (context, state) {
                return CustomButton(
                  height: 56,
                  onTap: state is CreateOrderLoading
                      ? null
                      : () async {
                          
                          await createOrder(context, selectedIndex);
                        },
                  color: kLightBlackColor,
                  child: state is CreateOrderLoading
                      ? CustomLoadingWidget(
                          color: Colors.white,
                        )
                      : Text(
                          textAlign: TextAlign.center,
                          'Checkout',
                          style:
                              Styles.style16Bold.copyWith(color: Colors.white),
                        ),
                  // color: ,
                );
              },
            ),
            16.verticalSizedBox,
          ],
        ),
      ),
    );
  }
}
