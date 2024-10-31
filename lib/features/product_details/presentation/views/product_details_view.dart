import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/widgets/custom_error_widget.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/cubit/get_product_details_cubit.dart';
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context
          .read<GetProductDetailsCubit>()
          .getProductDetails(productUrl: widget.productInfoUrl);
    });
    super.initState();
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
