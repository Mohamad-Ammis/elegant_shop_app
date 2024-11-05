
import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/add_review_bottom_sheet.dart';
import 'package:flutter/material.dart';

class AddReviewFloatingButton extends StatelessWidget {
  const AddReviewFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: kBackgroundColor,
          context: context,
          isDismissible: true,
          showDragHandle: true,
          builder: (context) {
            return const AddReviewBottomSheet();
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kPrimaryColor,
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
