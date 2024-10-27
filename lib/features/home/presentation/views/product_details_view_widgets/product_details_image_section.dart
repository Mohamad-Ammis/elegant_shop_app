import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/home/presentation/views/product_details_view_widgets/custom_special_icon.dart';
import 'package:elegant_shop_app/features/home/presentation/views/product_details_view_widgets/product_more_image_item.dart';
import 'package:flutter/material.dart';

class ProductDetailsImageSection extends StatefulWidget {
  const ProductDetailsImageSection({
    super.key,
  });

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
            margin: EdgeInsets.only(top: 20),
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    // width: double.infinity,
                    selectedImage,
                    fit: BoxFit.cover,
                  ),
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
          ),
          16.verticalSizedBox,
          SizedBox(
            height: 75,
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                        onTap: () {
                          selectedImage = Assets.imagesLogin;
                          setState(() {});
                        },
                        child: const ProductMoreImagesItem()),
                  );
                }),
          )
        ],
      ),
    );
  }
}
