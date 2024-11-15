import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/widgets/custom_app_bar.dart';
import 'package:elegant_shop_app/core/widgets/custom_error_widget.dart';
import 'package:elegant_shop_app/features/orders/presentation/manger/cubit/get_all_orders_cubit.dart';
import 'package:elegant_shop_app/features/orders/presentation/widgets/order_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<GetAllOrdersCubit>().page = 1;
      await context.read<GetAllOrdersCubit>().getAllOrders();
    }); //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<GetAllOrdersCubit, GetAllOrdersState>(
        builder: (context, state) {
          if (state is GetAllOrdersPaginationFailure) {
            return SizedBox(
                height: 50, child: CustomErrorWidget(title: state.errMessage));
          } else {
            return const SizedBox();
          }
        },
      ),
      backgroundColor: kBackgroundColor,
      appBar: const CustomAppbar(title: 'My Orders'),
      body: const Padding(
        padding: EdgeInsets.all(0),
        child: OrderViewBody(),
      ),
    );
  }
}
