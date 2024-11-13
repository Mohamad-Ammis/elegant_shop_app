import 'package:cached_network_image/cached_network_image.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/main.dart';
import 'package:flutter/material.dart';

class HomeViewAppBarImage extends StatelessWidget {
  const HomeViewAppBarImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: userInfo.getString('avatar') != null
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
              placeholder: (context, url) => const CustomLoadingWidget(),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            )
          : Image.asset(
              Assets.imagesPers,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
    );
  }
}
