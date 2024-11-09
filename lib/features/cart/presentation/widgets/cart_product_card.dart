import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              Assets.imagesLogin,
              fit: BoxFit.cover,
              height: 85,
            ),
          )),
          16.horizontalSizedBox,
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                    Icon(Icons.more_horiz)
                  ],
                ),
                4.verticalSizedBox,
                Text(
                  'T-Shirt',
                  style: Styles.style10Regular.copyWith(color: kSubTitleColor),
                ),
                16.verticalSizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      r'212.99$',
                      style: Styles.style14SemiBold,
                    ),
                    Row(
                      children: [
                        Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffDFDEDE)),
                                borderRadius: BorderRadius.circular(999)),
                            child: Icon(
                              size: 16,
                              Icons.remove,
                              color: kLightBlackColor,
                            )),
                        12.horizontalSizedBox,
                        Text('1'),
                        12.horizontalSizedBox,
                        Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffDFDEDE)),
                                borderRadius: BorderRadius.circular(999)),
                            child: Icon(
                              Icons.add_rounded,
                              size: 16,
                              color: kLightBlackColor,
                            )),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
