
import 'dart:developer';

import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/widgets/custom_button.dart';
import 'package:elegant_shop_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class AddReviewBottomSheet extends StatelessWidget {
  const AddReviewBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: kMainPagePadding, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: RatingBar.builder(
              initialRating: 1,
              itemSize: 35,
              itemBuilder: (context, index) {
                return SvgPicture.asset(Assets.imagesStar);
              },
              onRatingUpdate: (val) {
                log('val: $val');
              },
              unratedColor: kSubTitleColor.withOpacity(.2),
              minRating: 1,
            ),
          ),
          16.verticalSizedBox,
          CustomTextField(
            borderRadius: 12,
            textStyle: Styles.style14Regular,
            cursorColor: Colors.black,
            label: 'Commnet',
            labelStyle:
                Styles.style16Regular.copyWith(color: Colors.black54),
            filled: true,
            fillColor: kLightGreyColor,
            focusedBorderColor: kLightBlackColor.withOpacity(.2),
            enabledBorderColor: Colors.transparent,
            suffixIcon: null,
            maxLines: 4,
          ),
          8.verticalSizedBox,
          CustomButton(
            color: kPrimaryColor,
            child: Center(
              child: Text(
                'Submit',
                style:
                    Styles.style16Bold.copyWith(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
