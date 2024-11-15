import 'dart:developer';

import 'package:elegant_shop_app/core/widgets/custom_error_widget.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/orders/presentation/manger/cubit/get_all_orders_cubit.dart';
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
            : state is GetAllOrdersFailure
                ? CustomErrorWidget(title: state.errMessage)
                : const CustomLoadingWidget();
      },
    );
  }
}
