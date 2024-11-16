import 'package:cached_network_image/cached_network_image.dart';
import 'package:elegant_shop_app/core/utils/shimmer_custom_container.dart';
import 'package:elegant_shop_app/features/cart/data/models/cart_product_model/cart_product_model.dart';
import 'package:flutter/material.dart';

class CartProductCardCashedNetworkImage extends StatelessWidget {
  const CartProductCardCashedNetworkImage({
    super.key,
    required this.cartProductModel,
  });

  final CartProductModel cartProductModel;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      // width: double.infinity,
      height: 85,
      imageUrl: cartProductModel.product!.thumbnailUrl ?? '',
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const ShimmerContainer(
        width: double.infinity,
        height: double.infinity,
        circularRadius: 16,
      ),
      errorWidget: (context, url, error) =>
          const Center(child: Icon(Icons.error)),
    );
  }
}
