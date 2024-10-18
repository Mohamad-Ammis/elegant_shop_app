import 'dart:io';

import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/category_list_view.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/custom_search_textfield.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/home_view_appbar.dart';
import 'package:elegant_shop_app/main.dart';
import 'package:flutter/material.dart';

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
          CategoriesListView()
        ],
      ),
    );
  }
}
