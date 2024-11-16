import 'dart:developer';

import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/app_routes.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/utils/service_locator.dart';
import 'package:elegant_shop_app/core/widgets/drawer_item.dart';
import 'package:elegant_shop_app/core/widgets/drawer_model.dart';
import 'package:elegant_shop_app/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/home_view_app_bar_image.dart';
import 'package:elegant_shop_app/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationDrawer extends StatefulWidget {
  const CustomNavigationDrawer({super.key});

  @override
  State<CustomNavigationDrawer> createState() => _CustomNavigationDrawerState();
}

class _CustomNavigationDrawerState extends State<CustomNavigationDrawer> {
  List<DrawerModel> items = [];
  @override
  initState() {
    items = [
      DrawerModel(
        name: 'Home',
        icon: Assets.imagesHomeIcon,
        onPressed: () => onItemPressed(context, index: 0),
      ),
      DrawerModel(
          name: 'Favorites',
          icon: Assets.imagesWishlist,
          onPressed: () => onItemPressed(context, index: 1)),
      DrawerModel(
          name: 'Cart',
          icon: Assets.imagesCartIcon,
          onPressed: () => onItemPressed(context, index: 2)),
      DrawerModel(
          name: 'Orders',
          icon: Assets.imagesOrder2,
          onPressed: () => onItemPressed(context, index: 3)),
      DrawerModel(
          name: 'Log out',
          icon: Assets.imagesArrow,
          onPressed: () => onItemPressed(context, index: 4)),
    ];
    super.initState();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 22, 22, 22),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
        child: Column(
          children: [
            headerWidget(),
            16.verticalSizedBox,
            const Divider(
              thickness: 0.5,
              indent: 20,
              endIndent: 20,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                          log('selectedIndex: $selectedIndex');
                        },
                        child: DrawerItem(
                          model: items[index],
                          isSelected: selectedIndex == index,
                        ),
                      ),
                    );
                  }),
            )),
          ],
        ),
      ),
    );
  }

  Future<void> onItemPressed(BuildContext context, {required int index}) async {
    Navigator.pop(context);

    switch (index) {
      case 1:
        GoRouter.of(context).push(AppRouter.kFavoriteView);
        break;
      case 2:
        GoRouter.of(context).push(AppRouter.kCartView);
        break;
      case 3:
        GoRouter.of(context).push(AppRouter.kOrderView);
        break;
      case 4:
        context.go(AppRouter.kLoginView);
        log(userInfo.getString('auth_token') ?? 'qqdwd');
        bool status = await getIt.get<AuthRepoImplementation>().logOut();
        log('status: ${status}');
        userInfo.clear();
        break;
    }
  }

  Widget headerWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(999)),
              height: 50,
              width: 50,
              child: const HomeViewAppBarImage(
                color: Colors.white,
              )),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userInfo.getString('user_name').toString(),
                  overflow: TextOverflow.ellipsis,
                  style: Styles.style16Regular.copyWith(color: Colors.white)),
              const SizedBox(
                height: 10,
              ),
              Text(userInfo.getString('email').toString(),
                  style: Styles.style14Regular.copyWith(color: Colors.white))
            ],
          )
        ],
      ),
    );
  }
}
