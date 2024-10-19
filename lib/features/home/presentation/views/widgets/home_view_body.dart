import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/widgets/custom_error_widget.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/product_cubit/product_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/category_list_view.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/custom_search_textfield.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/home_view_appbar.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/product_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kMainPagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.verticalSizedBox,
          const HomeViewAppbar(),
          24.verticalSizedBox,
          const CustomSearchTextFiled(),
          40.verticalSizedBox,
          const CategoriesListView(),
          8.verticalSizedBox,
          const Expanded(
            child: ProductsGridView(),
          ),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductPaginationFailure) {
                return CustomErrorWidget(title: state.errMessage);
              } else {
                return SizedBox.shrink();
              }
            },
          )
        ],
      ),
    );
  }
}
