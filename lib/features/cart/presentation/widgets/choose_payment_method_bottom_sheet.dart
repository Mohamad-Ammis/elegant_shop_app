import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/cart/data/models/payment_method_item_model.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/payment_method_item.dart';
import 'package:elegant_shop_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

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
    return Padding(
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
          CustomButton(
            color: kLightBlackColor,
            child: Text(
              textAlign: TextAlign.center,
              'Checkout',
              style: Styles.style16Bold.copyWith(color: Colors.white),
            ),
            // color: ,
          ),
          16.verticalSizedBox,
        ],
      ),
    );
  }
}
