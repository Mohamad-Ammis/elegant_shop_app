import 'dart:developer';

import 'package:elegant_shop_app/core/utils/app_routes.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/widgets/drawer_item.dart';
import 'package:elegant_shop_app/core/widgets/drawer_model.dart';
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
        icon: Icons.home,
        onPressed: () => onItemPressed(context, index: 0),
      ),
      DrawerModel(
          name: 'Favorites',
          icon: Icons.favorite,
          onPressed: () => onItemPressed(context, index: 1)),
      DrawerModel(
          name: 'Cart',
          icon: Icons.shopping_cart_outlined,
          onPressed: () => onItemPressed(context, index: 2)),
      DrawerModel(
          name: 'Favourites',
          icon: Icons.favorite_outline,
          onPressed: () => onItemPressed(context, index: 3)),
      DrawerModel(
          name: 'Setting',
          icon: Icons.settings,
          onPressed: () => onItemPressed(context, index: 4)),
      DrawerModel(
          name: 'Log out',
          icon: Icons.logout,
          onPressed: () => onItemPressed(context, index: 5)),
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
                      padding: const EdgeInsets.all(8.0),
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
            // const SizedBox(
            //   height: 40,
            // ),
            // const Divider(
            //   thickness: 1,
            //   height: 10,
            //   color: Colors.grey,
            // ),
            // 40.verticalSizedBox,
            // DrawerItem(
            //   name: 'People',
            //   icon: Icons.people,
            //   onPressed: () => onItemPressed(context, index: 0),
            //   isSelected: selectedIndex == 0,
            // ),
            // 16.verticalSizedBox,
            // DrawerItem(
            //   name: 'My Account',
            //   icon: Icons.account_box_rounded,
            //   onPressed: () => onItemPressed(context, index: 1),
            //   isSelected: selectedIndex == 1,
            // ),
            // 16.verticalSizedBox,
            // DrawerItem(
            //   name: 'Chats',
            //   icon: Icons.message_outlined,
            //   onPressed: () => onItemPressed(context, index: 2),
            //   isSelected: selectedIndex == 2,
            // ),
            // 16.verticalSizedBox,
            // DrawerItem(
            //   name: 'Favourites',
            //   icon: Icons.favorite_outline,
            //   onPressed: () => onItemPressed(context, index: 3),
            //   isSelected: selectedIndex == 3,
            // ),
            // const SizedBox(
            //   height: 30,
            // ),
            // const Divider(
            //   thickness: 1,
            //   height: 10,
            //   color: Colors.grey,
            // ),
            // 16.verticalSizedBox,
            // DrawerItem(
            //   name: 'Setting',
            //   icon: Icons.settings,
            //   onPressed: () => onItemPressed(context, index: 4),
            //   isSelected: selectedIndex == 4,
            // ),
            // 16.verticalSizedBox,
            // DrawerItem(
            //   name: 'Log out',
            //   icon: Icons.logout,
            //   onPressed: () => onItemPressed(context, index: 5),
            //   isSelected: selectedIndex == 5,
            // ),
          ],
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 1:
        GoRouter.of(context).push(AppRouter.kFavoriteView);
        break;
      case 2:
        GoRouter.of(context).push(AppRouter.kCartView);
        break;
    }
  }

  Widget headerWidget() {
    const url =
        'https://media.istockphoto.com/photos/learn-to-love-yourself-first-picture-id1291208214?b=1&k=20&m=1291208214&s=170667a&w=0&h=sAq9SonSuefj3d4WKy4KzJvUiLERXge9VgZO-oqKUOo=';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(url),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Person name',
                  style: Styles.style16Regular.copyWith(color: Colors.white)),
              const SizedBox(
                height: 10,
              ),
              Text('person@email.com',
                  style: Styles.style14Regular.copyWith(color: Colors.white))
            ],
          )
        ],
      ),
    );
  }
}
