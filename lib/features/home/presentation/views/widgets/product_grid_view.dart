import 'dart:developer';

import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/utils/shimmer_custom_container.dart';
import 'package:elegant_shop_app/core/widgets/custom_error_widget.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/product_cubit/product_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({
    super.key,
  });

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  final ScrollController _scrollController = ScrollController();
  late final ProductCubit productCubit;
  @override
  void initState() {
    productCubit = context.read<ProductCubit>();
    super.initState();
    _scrollController.addListener(_onScroll); // الاستماع لعملية التمرير
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (productCubit.state is ProductLoading ||
          productCubit.state is ProductPaginationLoading) {
        log("state Loading");
        return;
      } else {
        log("reach max of products List");
        if (productCubit.hasNext) {
          if (BlocProvider.of<ProductCubit>(context).searchText.isNotEmpty) {
            productCubit.searchProducts(fromPagination: true);
          } else {
            productCubit.page = 1;
            log("call pagination product api");
            productCubit.getAllProducts(fromPagination: true);
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductFailure) {
          return CustomErrorWidget(title: state.errMessage);
        } else if (state is ProductSuccess ||
            state is ProductPaginationLoading ||
            state is ProductPaginationFailure) {
          return StaggeredGridView.countBuilder(
            controller: _scrollController,
            crossAxisCount: 4,
            itemCount: state is ProductPaginationLoading
                ? productCubit.products.length + 1
                : productCubit.products.length,
            itemBuilder: (context, index) {
              return index < productCubit.products.length
                  ? ProductCard(
                      product: productCubit.products[index],
                    )
                  : const ProductShimmerCard();
            },
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(2, index.isOdd ? 4.0 : 3.4),
            mainAxisSpacing: 24.0,
            crossAxisSpacing: 17.0,
          );
        } else {
          return StaggeredGridView.countBuilder(
            controller: _scrollController,
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
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class ProductShimmerCard extends StatelessWidget {
  const ProductShimmerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: ShimmerContainer(
              width: double.infinity, height: 250, circularRadius: 16),
        ),
        8.verticalSizedBox,
        const ShimmerContainer(width: 100, height: 20, circularRadius: 16),
        8.verticalSizedBox,
        const ShimmerContainer(width: 50, height: 20, circularRadius: 16),
        8.verticalSizedBox,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShimmerContainer(width: 50, height: 20, circularRadius: 16),
            ShimmerContainer(width: 50, height: 20, circularRadius: 16),
            SizedBox(
              width: 10,
            )
          ],
        )
      ],
    );
  }
}
