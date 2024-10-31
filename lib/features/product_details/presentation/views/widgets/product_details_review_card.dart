import 'package:cached_network_image/cached_network_image.dart';
import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/product_details/data/models/review_model/review_model.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_reviews_rating_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductDetailsReviewCard extends StatelessWidget {
  const ProductDetailsReviewCard({
    super.key,
    required this.reviewModel,
  });
  final ReviewModel reviewModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(999)),
              width: 60,
              height: 60,
              child: reviewModel.user?.avatar == null
                  ? Image.asset(Assets.imagesPers)
                  : CachedNetworkImage(
                      imageUrl: reviewModel.user?.avatar ?? '',
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const CustomLoadingWidget(),
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                    )),
          16.horizontalSizedBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 1.8,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        reviewModel.user?.username ?? 'Anonymous User',
                        style: Styles.style20Regular,
                      ),
                    ),
                    const Icon((Icons.more_vert_rounded))
                  ],
                ),
                ProductDetailsReviewRating(
                  count: reviewModel.rating ?? 0,
                ),
                10.verticalSizedBox,
                Text(
                  reviewModel.comment ?? '',
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
