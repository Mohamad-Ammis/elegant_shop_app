// ignore_for_file: use_build_context_synchronously

import 'package:elegant_shop_app/features/favorite/data/models/favorite_product_model.dart';
import 'package:elegant_shop_app/features/favorite/presentation/manger/cubit/get_all_favorites_products_cubit.dart';
import 'package:elegant_shop_app/features/favorite/presentation/manger/toggle_favorite_cubit/toggle_favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class FavoriteIconSection extends StatelessWidget {
  FavoriteIconSection({super.key, required this.favoriteProductModel});
  final FavoriteProductModel favoriteProductModel;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                topRight: Radius.circular(16))),
        child: BlocBuilder<ToggleFavoriteCubit, ToggleFavoriteState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: state is ToggleFavoriteLoading
                  ? null
                  : () async {
                      isLoading = true;
                      await context.read<ToggleFavoriteCubit>().toggleFavorite(
                          productID:
                              favoriteProductModel.product!.id.toString());
                      isLoading = false;
                      context.read<GetAllFavoritesProductsCubit>().page = 1;
                      await context
                          .read<GetAllFavoritesProductsCubit>()
                          .getAllFavoriteProducts();
                    },
              child: isLoading
                  ? const SizedBox(
                      height: 25, width: 25, child: CircularProgressIndicator())
                  : const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
            );
          },
        ),
      ),
    ));
  }
}
