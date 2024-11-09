import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/widgets/drawer_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerItem extends StatelessWidget {
  DrawerItem({super.key, required this.model, required this.isSelected});

  final DrawerModel model;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: model.onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? Colors.grey.withOpacity(.07) : null,
            borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        // height: 40,
        child: Row(
          children: [
            Icon(
              model.icon,
              size: 20,
              color: Colors.white,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              model.name,
              style: Styles.style20Regular.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
