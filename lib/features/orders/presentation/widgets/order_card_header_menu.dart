import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OrderCardHeaderMenu extends StatelessWidget {
  const OrderCardHeaderMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        showMenu(
          menuPadding: const EdgeInsets.all(0),
          color: Colors.white,
          context: context,
          position: RelativeRect.fromLTRB(
            details.globalPosition.dx,
            details.globalPosition.dy,
            details.globalPosition.dx,
            details.globalPosition.dy,
          ),
          items: [
            PopupMenuItem(
              onTap: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Cancel',
                    style: Styles.style14Bold,
                  ),
                ],
              ),
            ),
          ],
        );
      },
      child: const Icon(Icons.more_horiz),
    );
  }
}
