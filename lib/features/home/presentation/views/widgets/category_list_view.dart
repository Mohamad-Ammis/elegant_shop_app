
import 'package:elegant_shop_app/features/home/presentation/views/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  currentIndex = index;
                  setState(() {});
                },
                child: CategoryItem(
                  title: 'All items',
                  isActive: currentIndex == index,
                ));
          }),
    );
  }
}
