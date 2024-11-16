import 'package:cached_network_image/cached_network_image.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/shimmer_custom_container.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/main.dart';
import 'package:flutter/material.dart';

class HomeViewAppBarImage extends StatelessWidget {
  const HomeViewAppBarImage({
    super.key, this.color,
  });
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: userInfo.getString('avatar') != ''
          ? CachedNetworkImage(
              // width: 100,
              // height: 100,
              imageUrl: userInfo.getString('avatar')!,
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
          : Image.asset(
              Assets.imagesPers,
              width: double.infinity,
              fit: BoxFit.cover,
              color: color,
            ),
    );
  }
}
