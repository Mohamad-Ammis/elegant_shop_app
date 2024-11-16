import 'dart:developer';

import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/shimmer_custom_container.dart';
import 'package:elegant_shop_app/core/widgets/custom_empty_state_widget.dart';
import 'package:elegant_shop_app/core/widgets/custom_error_widget.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/orders/presentation/manger/get_all_orders_cubit/get_all_orders_cubit.dart';
import 'package:elegant_shop_app/features/orders/presentation/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersListView extends StatefulWidget {
  const OrdersListView({
    super.key,
  });

  @override
  State<OrdersListView> createState() => _OrdersListViewState();
}

class _OrdersListViewState extends State<OrdersListView> {
  late final GetAllOrdersCubit getAllOrdersCubit;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    getAllOrdersCubit = context.read<GetAllOrdersCubit>();
    _scrollController.addListener(_scroll);
    super.initState();
  }

  _scroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (getAllOrdersCubit.state is GetAllOrdersLoading ||
          getAllOrdersCubit.state is GetAllOrdersPaginationLoading) {
        log("state Loading");
        return;
      } else {
        log("reach max of products List");
        if (getAllOrdersCubit.hasNext) {
          log("call pagination product api");
          getAllOrdersCubit.getAllOrders(fromPagination: true);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllOrdersCubit, GetAllOrdersState>(
      builder: (context, state) {
        return state is GetAllOrdersSuccess ||
                state is GetAllOrdersPaginationLoading ||
                state is GetAllOrdersPaginationFailure
            ? getAllOrdersCubit.orders.isNotEmpty
                ? ListView.builder(
                    controller: _scrollController,
                    itemCount: state is GetAllOrdersPaginationLoading
                        ? getAllOrdersCubit.orders.length + 1
                        : getAllOrdersCubit.orders.length,
                    itemBuilder: (context, index) {
                      return index < getAllOrdersCubit.orders.length
                          ? OrderCard(
                              orderModel: getAllOrdersCubit.orders[index],
                            )
                          : const CustomLoadingWidget();
                    },
                  )
                : const CustomEmptyStateWidget(
                    title: "Sorry you don't have any orders")
            : state is GetAllOrdersFailure
                ? CustomErrorWidget(title: state.errMessage)
                : const OrdersShimmerLoadingListView();
      },
    );
  }
}

class OrdersShimmerLoadingListView extends StatelessWidget {
  const OrdersShimmerLoadingListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ShimmerContainer(
          width: double.infinity,
          height: 120,
          circularRadius: 16,
          margin:
              EdgeInsets.symmetric(horizontal: kMainPagePadding, vertical: 12),
        );
      },
    );
  }
}
