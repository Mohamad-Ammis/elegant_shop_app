import 'package:cached_network_image/cached_network_image.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/shimmer_custom_container.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductImageSection extends StatelessWidget {
  const ProductImageSection({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: product.thumbnailUrl != null
            ? product.discount?.active ?? false
                ? Banner(
                    message: '${product.discount!.percent.toString()}%',
                    location: BannerLocation.topStart,
                    child: ProductCardCachedNetworkImage(product: product),
                  )
                : ProductCardCachedNetworkImage(product: product)
            : Image.asset(
                Assets.imagesErrorImage,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

class ProductCardCachedNetworkImage extends StatelessWidget {
  const ProductCardCachedNetworkImage({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: double.infinity,
      imageUrl: product.thumbnailUrl!,
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
