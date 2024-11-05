import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class FavoriteProductCard extends StatelessWidget {
  const FavoriteProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            height: double.infinity,
            width: double.infinity,
            Assets.imagesRegister,
            fit: BoxFit.cover,
          ),
        ),
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
