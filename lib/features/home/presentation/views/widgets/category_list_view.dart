import 'package:elegant_shop_app/core/utils/app_routes.dart';
import 'package:elegant_shop_app/core/widgets/custom_error_widget.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/category_cubit/category_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/category_cubit/category_helper_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/category_item.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/category_loading_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

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
              return context.read<CategoryHelperCubit>().showCategory
                  ? AnimatedContainer(
                      height: 85,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 300),
                      child: ListView.builder(
                          cacheExtent: 10,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.categories.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () async {
                                  context.push(
                                    AppRouter.kCategoryProductsView,
                                    extra: {
                                      'categoryName':
                                          state.categories[index].name!,
                                      'categoryApiUrl':
                                          state.categories[index].absoluteUrl!,
                                    },
                                  );
                                },
                                child: CategoryItem(
                                  model: state.categories[index],
                                ));
                          }),
                    )
                  : const SizedBox();
            },
          );
        } else {
          return const CategoryLoadingShimmerListView();
        }
      },
    );
  }
}
