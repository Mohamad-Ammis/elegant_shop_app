import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/home/presentation/views/product_details_view_widgets/custom_special_icon.dart';
import 'package:elegant_shop_app/features/home/presentation/views/product_details_view_widgets/product_more_image_item.dart';
import 'package:flutter/material.dart';

class ProductDetailsImageSection extends StatefulWidget {
  const ProductDetailsImageSection({super.key});

  @override
  State<ProductDetailsImageSection> createState() =>
      _ProductDetailsImageSectionState();
}

class _ProductDetailsImageSectionState
    extends State<ProductDetailsImageSection> {
  String selectedImage = Assets.imagesProduct1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMainPagePadding),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height / 2.5,
            margin: const EdgeInsets.only(top: 20),
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: Image.asset(
                      key: ValueKey<String>(selectedImage),
                      selectedImage,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const CustomSpecialIcon(
                  alignment: Alignment.topLeft,
                  icon: Icon(Icons.arrow_back_ios_sharp),
                ),
                const CustomSpecialIcon(
                  alignment: Alignment.topRight,
                  icon: Icon(Icons.favorite_border),
                ),
              ],
            ),
          ),
          16.verticalSizedBox,
          SizedBox(
            height: 75,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedImage = Assets.imagesLogin;
                      });
                    },
                    child: const ProductMoreImagesItem(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
