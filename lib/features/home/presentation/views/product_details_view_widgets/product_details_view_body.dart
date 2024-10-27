import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/home/presentation/views/product_details_view_widgets/custom_special_icon.dart';
import 'package:elegant_shop_app/features/home/presentation/views/product_details_view_widgets/product_details_image_section.dart';
import 'package:elegant_shop_app/features/home/presentation/views/product_details_view_widgets/product_details_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ProductDetailsImageSection(),
          ),
          SliverToBoxAdapter(
            child: ProductDetailsInfo(),
          )
        ],
      ),
    );
  }
}
