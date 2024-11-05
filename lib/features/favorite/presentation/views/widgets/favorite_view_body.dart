import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/features/favorite/presentation/views/widgets/favorite_product_card.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: kMainPagePadding),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const FavoriteProductCard();
          },
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index.isOdd ? 3.5 : 3.1),
          mainAxisSpacing: 24.0,
          crossAxisSpacing: 17.0,
        ));
  }
}
