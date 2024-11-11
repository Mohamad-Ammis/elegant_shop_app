import 'package:cached_network_image/cached_network_image.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/cart/data/models/cart_product_model/cart_product_model.dart';
import 'package:flutter/material.dart';

class CartProductCardImage extends StatelessWidget {
  const CartProductCardImage({
    super.key,
    required this.cartProductModel,
  });
  final CartProductModel cartProductModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
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
        placeholder: (context, url) => const CustomLoadingWidget(),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
      ),
    ));
  }
}
