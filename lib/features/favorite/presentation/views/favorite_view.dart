import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/widgets/custom_app_bar.dart';
import 'package:elegant_shop_app/core/widgets/custom_error_widget.dart';
import 'package:elegant_shop_app/features/favorite/presentation/manger/cubit/get_all_favorites_products_cubit.dart';
import 'package:elegant_shop_app/features/favorite/presentation/views/widgets/favorite_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<GetAllFavoritesProductsCubit,
          GetAllFavoritesProductsState>(
        builder: (context, state) {
          if (state is GetAllFavoritesProductsPaginationFailure) {
            return SizedBox(
                height: 50, child: CustomErrorWidget(title: state.errMessage,hasAnimation: false,));
          } else {
            return const SizedBox();
          }
        },
      ),
      appBar: const CustomAppbar(title: 'Favorites'),
      backgroundColor: kBackgroundColor,
      body: const FavoriteViewBody(),
    );
  }
}
