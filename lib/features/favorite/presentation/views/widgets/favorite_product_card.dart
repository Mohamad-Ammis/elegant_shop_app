import 'package:cached_network_image/cached_network_image.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/shimmer_custom_container.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/favorite/data/models/favorite_product_model.dart';
import 'package:elegant_shop_app/features/favorite/presentation/views/widgets/favorite_icon_section.dart';
import 'package:flutter/material.dart';

class FavoriteProductCard extends StatelessWidget {
  const FavoriteProductCard({super.key, required this.favoriteProductModel});
  final FavoriteProductModel favoriteProductModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: favoriteProductModel.product!.thumbnailUrl != null
                ? CachedNetworkImage(
                    height: double.infinity,
                    width: double.infinity,
                    imageUrl: favoriteProductModel.product!.thumbnailUrl!,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => ShimmerContainer(
        width: double.infinity,
        height: double.infinity,
        circularRadius: 16,
      ),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  )
                : Image.asset(Assets.imagesErrorImage)),
        FavoriteIconSection(favoriteProductModel: favoriteProductModel)
      ],
    );
  }
}
