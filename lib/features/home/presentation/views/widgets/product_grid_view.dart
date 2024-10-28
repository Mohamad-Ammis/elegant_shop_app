import 'dart:developer';
import 'package:elegant_shop_app/core/widgets/custom_error_widget.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/product_cubit/product_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/product_card.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/product_shimmer_card.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/products_loading_shimmer_grid_view.dart';
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
        //when reach end we have 2 state ,
        //first we must check if we are not using category because there are no pagination in category api
        if (productCubit.hasNext && productCubit.selectedCategoryId == -1) {
          //first state we have search text so use search api
          if (productCubit.searchText.isNotEmpty) {
            log("call pagination product search api");
            productCubit.searchProducts(fromPagination: true);
          }
          //second state we haven't search text so use all products api
          else {
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
          return productCubit.products.isEmpty
              ? const CustomErrorWidget(title: 'Sorry There is no products ')
              : StaggeredGridView.countBuilder(
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
          return ProductsLoadingShimmerGridView();
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
