import 'package:cached_network_image/cached_network_image.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';

class ProductMoreImagesItem extends StatelessWidget {
  const ProductMoreImagesItem({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 75,
        height: 75,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: CachedNetworkImage(
          imageUrl: image,
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
        ));
  }
}
