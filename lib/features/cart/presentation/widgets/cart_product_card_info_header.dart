import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CartProductCardInfoHeader extends StatelessWidget {
  const CartProductCardInfoHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width / 2.5,
          child: Text(
            overflow: TextOverflow.ellipsis,
            'Ammis Black JAcket',
            style: Styles.style14SemiBold,
          ),
        ),
        const Icon(Icons.more_horiz)
      ],
    );
  }
}
