import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/home/presentation/views/product_details_view_widgets/custom_special_icon.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kMainPagePadding),
        child: Column(
          children: [
            30.verticalSizedBox,
            Expanded(
                flex: 4,
                child: ProductDetailsImageSection()),
            Expanded(flex: 3, child: Container())
          ],
        ),
      ),
    );
  }
}

class ProductDetailsImageSection extends StatelessWidget {
  const ProductDetailsImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Image.asset(
            width: double.infinity,
            Assets.imagesProduct1,
            fit: BoxFit.cover,
          ),
          CustomSpecialIcon(
            alignment: Alignment.topLeft,
            icon: Icon(
              Icons.arrow_back_ios_sharp,
            ),
          ),
          CustomSpecialIcon(
            alignment: Alignment.topRight,
            icon: Icon(
              Icons.favorite,
            ),
          )
        ],
      ),
    );
  }
}
