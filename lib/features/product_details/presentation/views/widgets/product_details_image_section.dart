import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/favorite/presentation/manger/toggle_favorite_cubit/toggle_favorite_cubit.dart';
import 'package:elegant_shop_app/features/product_details/data/models/product_details_model/product_details_model.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/custom_special_icon.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_more_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsImageSection extends StatefulWidget {
  const ProductDetailsImageSection(
      {super.key, required this.productDetailsModel});
  final ProductDetailsModel productDetailsModel;
  @override
  State<ProductDetailsImageSection> createState() =>
      _ProductDetailsImageSectionState();
}

class _ProductDetailsImageSectionState
    extends State<ProductDetailsImageSection> {
  late bool isFavorite;
  late String selectedImage;
  @override
  void initState() {
    selectedImage = widget.productDetailsModel.thumbnailUrl ?? '';
    log('widget.productDetailsModel.isFavorite: ${widget.productDetailsModel.isFavorite}');
    isFavorite = widget.productDetailsModel.isFavorite ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMainPagePadding),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height / 2.5,
            margin: const EdgeInsets.only(top: 20),
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin:
                              const Offset(2.0, 0.0), // تبدأ الانتقال من اليمين
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    },
                    child: selectedImage != ''
                        ? CachedNetworkImage(
                            key: ValueKey<String>(selectedImage),
                            width: double.infinity,
                            height: double.infinity,
                            imageUrl: selectedImage,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) =>
                                const CustomLoadingWidget(),
                            errorWidget: (context, url, error) =>
                                const Center(child: Icon(Icons.error)),
                          )
                        : Image.asset(
                            Assets.imagesErrorImage,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                CustomSpecialIcon(
                  alignment: Alignment.topLeft,
                  icon: const Icon(Icons.arrow_back_ios_sharp),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                ),
                BlocBuilder<ToggleFavoriteCubit, ToggleFavoriteState>(
                  builder: (context, state) {
                    return CustomSpecialIcon(
                      alignment: Alignment.topRight,
                      icon: state is ToggleFavoriteLoading
                          ? const SizedBox(
                              height: 23,
                              width: 23,
                              child: CircularProgressIndicator(),
                            )
                          : Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.black,
                            ),
                      onTap: () async {
                        isFavorite = await context
                            .read<ToggleFavoriteCubit>()
                            .toggleFavorite(
                                productID:
                                    widget.productDetailsModel.id.toString());
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          16.verticalSizedBox,
          widget.productDetailsModel.images?.isEmpty ?? true
              ? const SizedBox()
              : SizedBox(
                  height: 75,
                  child: ListView.builder(
                    itemCount: widget.productDetailsModel.images?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedImage = widget
                                      .productDetailsModel.images?[index].url ??
                                  '';
                            });
                          },
                          child: ProductMoreImagesItem(
                            image:
                                widget.productDetailsModel.images?[index].url ??
                                    '',
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
