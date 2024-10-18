import 'package:elegant_shop_app/core/helper/homes_scroll_controller_service.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/category_list_view.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/custom_search_textfield.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/home_view_appbar.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/product_grid_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  HomeViewBodyState createState() => HomeViewBodyState();
}

class HomeViewBodyState extends State<HomeViewBody> {
  late HomeScrollControllerService _scrollControllerService;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollControllerService = HomeScrollControllerService(_scrollController);
  }

  @override
  void dispose() {
    _scrollControllerService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Column(
              children: [
                24.verticalSizedBox,
                const HomeViewAppbar(),
                24.verticalSizedBox,
                const CustomSearchTextFiled(),
                40.verticalSizedBox,
                const CategoriesListView(),
                8.verticalSizedBox,
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: ProductsGridView(),
          ),
        ),
      ],
    );
  }
}
