import 'package:elegant_shop_app/core/widgets/custom_error_widget.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/category_cubit/category_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/category_cubit/category_helper_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/product_cubit/product_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/category_item.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/category_loading_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryFailure) {
          return CustomErrorWidget(
            title: state.errMessage,
          );
        } else if (state is CategorySuccess) {
          return BlocBuilder<CategoryHelperCubit, bool>(
            builder: (context, helperState) {
              return AnimatedContainer(
                height: !helperState ? 0 : 35,
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 300),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            ProductCubit cubit = context.read<ProductCubit>();
                            cubit.selectedCategoryId =
                                state.categories[index].id!;
                            currentIndex = index;
                            cubit.page = 1;

                            cubit.getProductsByCategory(
                                selectedCategorySlug:
                                    cubit.selectedCategoryId.toString());
                            setState(() {});
                          },
                          child: CategoryItem(
                            title: state.categories[index].name ?? '',
                            isActive: currentIndex == index,
                          ));
                    }),
              );
            },
          );
        } else {
          return const CategoryLoadingShimmerListView();
        }
      },
    );
  }
}
