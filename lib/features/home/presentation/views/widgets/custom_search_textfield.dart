import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/category_cubit/category_helper_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/product_cubit/product_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchTextFiled extends StatelessWidget {
  const CustomSearchTextFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: kSubTitleColor, width: 0.1),
              borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.hardEdge,
          width: MediaQuery.sizeOf(context).width / 1.5,
          child: TextField(
            onChanged: (value) {
              BlocProvider.of<ProductCubit>(context).searchText = value;
              BlocProvider.of<ProductCubit>(context).page = 1;
              BlocProvider.of<ProductCubit>(context).products = [];
              BlocProvider.of<ProductCubit>(context).searchProducts();
            },
            textAlignVertical: TextAlignVertical.center,
            cursorColor: Colors.black,
            style: Styles.style14Regular.copyWith(color: Colors.black),
            decoration: InputDecoration(
              filled: false,
              fillColor: null,
              hintText: 'Search clothes...',
              hintStyle: Styles.style14Regular.copyWith(color: kSubTitleColor),
              prefixIcon: SvgPicture.asset(
                Assets.imagesSearchIcon,
                // ignore: deprecated_member_use
                color: kSubTitleColor,
                width: 30,
                fit: BoxFit.scaleDown,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        GestureDetector(
          onTap: () {
            BlocProvider.of<CategoryHelperCubit>(context).changeCategoryState();
          },
          child: Container(
              decoration: BoxDecoration(
                  color: kLightBlackColor,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(18),
              child: SvgPicture.asset(
                Assets.imagesFilter,
                // ignore: deprecated_member_use
                color: Colors.white,
              )),
        )
      ],
    );
  }
}
