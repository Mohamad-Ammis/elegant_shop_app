import 'package:cached_network_image/cached_network_image.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/favorite/data/models/favorite_product_model.dart';
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
            child:  favoriteProductModel.product!.thumbnailUrl!=null? CachedNetworkImage(
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
              placeholder: (context, url) => const CustomLoadingWidget(),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ):Image.asset(Assets.imagesErrorImage)),
        Positioned.fill(
            child: Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ))
      ],
    );
  }
}
