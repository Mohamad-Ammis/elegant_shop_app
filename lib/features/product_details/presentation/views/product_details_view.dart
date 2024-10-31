import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/widgets/custom_error_widget.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/get_product_details/get_product_details_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/product_important_reviews_cubit/product_important_reviews_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_floating_buy_sections.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.productInfoUrl});
  final String productInfoUrl;
  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //to fix This widget has been unmounted exception
      if (!mounted) return;
      await context
          .read<GetProductDetailsCubit>()
          .getProductDetails(productUrl: widget.productInfoUrl);
      if (!mounted) return;
      await context
          .read<ProductImportantReviewsCubit>()
          .getProductImportantReviews(productUrl: widget.productInfoUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocBuilder<GetProductDetailsCubit, GetProductDetailsState>(
        builder: (context, state) {
          return state is GetProductDetailsSuccess
              ? Stack(
                  children: [
                    ProductDetailsViewBody(
                      productDetailsModel: state.productDetailsModel,
                    ),
                    ProductDetailsFloatingBuySection(),
                  ],
                )
              : state is GetProductDetailsFailure
                  ? CustomErrorWidget(title: state.errMessage)
                  : CustomLoadingWidget();
        },
      ),
    );
  }
}
