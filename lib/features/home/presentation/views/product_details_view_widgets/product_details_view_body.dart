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
          ),
          SliverToBoxAdapter(
            child: ProductReviews(),
          ),
        ],
      ),
    );
  }
}

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMainPagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSizedBox,
          Text(
            'Reviews (7201)',
            style: Styles.style20Regular,
          ),
          16.verticalSizedBox,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5, // عدد العناصر الافتراضي
            itemBuilder: (context, index) {
              return ProductDetailsReviewCard();
            },
          ),
        ],
      ),
    );
  }
}

class ProductDetailsReviewCard extends StatelessWidget {
  const ProductDetailsReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(999)),
            width: 60,
            height: 60,
            child: Image.asset(
              Assets.imagesLogin,
              fit: BoxFit.cover,
            ),
          ),
          16.horizontalSizedBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mohamad Ammis',
                      style: Styles.style20Regular,
                    ),
                    Icon((Icons.more_vert_rounded))
                  ],
                ),
                ProductDetailsReviewRating(),
                10.verticalSizedBox,
                Text(
                  'Its simple and elegant shape makes it perfect for those of you who like you who want minimalist clothes Read More. . . Its simple and elegant shape makes it perfect for those of you who like you who want minimalist clothes Read More. . .',
                  style: Styles.style12Regular.copyWith(color: kSubTitleColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductDetailsReviewRating extends StatelessWidget {
  const ProductDetailsReviewRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.imagesStar,
        ),
        SvgPicture.asset(
          Assets.imagesStar,
        ),
        SvgPicture.asset(
          Assets.imagesStar,
        ),
        SvgPicture.asset(
          Assets.imagesStar,
        ),
        SvgPicture.asset(
          Assets.imagesStar,
          colorFilter: ColorFilter.mode(
            Colors.grey,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }
}
