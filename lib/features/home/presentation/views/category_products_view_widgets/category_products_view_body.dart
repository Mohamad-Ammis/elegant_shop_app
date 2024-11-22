import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/cubit/get_category_products_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/views/category_products_view_widgets/category_products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsViewBody extends StatefulWidget {
  const CategoryProductsViewBody({super.key, required this.categoryApiUrl});
  final String categoryApiUrl;
  @override
  State<CategoryProductsViewBody> createState() =>
      _CategoryProductsViewBodyState();
}

class _CategoryProductsViewBodyState extends State<CategoryProductsViewBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context
          .read<GetCategoryProductsCubit>()
          .getProductsByCategory(apiUrl: widget.categoryApiUrl);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kMainPagePadding),
      child: CategoryProductsGridView(
        categoryApiUrl: widget.categoryApiUrl,
      ),
    );
  }
}
