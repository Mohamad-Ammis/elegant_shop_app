import 'package:cached_network_image/cached_network_image.dart';
import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/home/data/models/category_model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.model,
  });
  final CategoryModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          width: 60,
          height: 60,
          clipBehavior: Clip.hardEdge,
          transformAlignment: AlignmentDirectional.center,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              border: Border.all(width: .1, color: kSubTitleColor)),
          duration: const Duration(milliseconds: 300),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
              imageUrl: model.icon ?? '',
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
          ),
        ),
        4.verticalSizedBox,
        Center(
          child: SizedBox(
            width: 60,
            child: Text(
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              model.name ?? '',
              style: Styles.style12Regular,
            ),
          ),
        ),
      ],
    );
  }
}
