import 'package:elegant_shop_app/features/home/presentation/views/widgets/product_shimmer_card.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class ProductsLoadingShimmerGridView extends StatelessWidget {
  const ProductsLoadingShimmerGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: 6,
      itemBuilder: (context, index) {
        return const ProductShimmerCard();
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isOdd ? 4.0 : 3.4),
      mainAxisSpacing: 24.0,
      crossAxisSpacing: 17.0,
    );
  }
}
