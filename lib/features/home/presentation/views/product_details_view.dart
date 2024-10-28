import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/home/presentation/views/product_details_view_widgets/product_details_view_body.dart';
import 'package:elegant_shop_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      bottomNavigationBar: Container(
        padding:
            EdgeInsets.symmetric(horizontal: kMainPagePadding, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
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
            CustomButton(
              width: 60,
              color: kLightBlackColor,
              borderRadius: BorderRadius.circular(16),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: ProductDetailsViewBody(),
    );
  }
}

class CustomBottomPaymentbar extends StatelessWidget {
  const CustomBottomPaymentbar({
    super.key,
  });

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
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(16),
                child: Text(
                  textAlign: TextAlign.center,
                  'Buy Now',
                  style: Styles.style18Bold.copyWith(color: Colors.white),
                ),
              ),
            ),
            16.horizontalSizedBox,
            CustomButton(
              width: 60,
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(16),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
