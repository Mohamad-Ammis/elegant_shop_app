import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elegant_shop_app/features/orders/data/models/create_order_model/order.dart';
import 'package:elegant_shop_app/features/orders/data/repo/order_repo.dart';
import 'package:meta/meta.dart';

part 'get_all_orders_state.dart';

class GetAllOrdersCubit extends Cubit<GetAllOrdersState> {
  GetAllOrdersCubit({required this.orderRepo}) : super(GetAllOrdersInitial());
  final OrderRepo orderRepo;
  int page = 1;
  List<OrderModel> orders = [];
  bool hasNext = false;
  Future<void> getAllOrders({bool fromPagination = false}) async {
    try {
      try {
        if (page == 1) {
          orders.clear();
        }
        if (fromPagination) {
          emit(GetAllOrdersPaginationLoading());
        } else {
          emit(GetAllOrdersLoading());
        }
        var data = await orderRepo.getAllOrders(page: page);
        data.fold((failure) {
          if (fromPagination) {
            emit(GetAllOrdersPaginationFailure(
                errMessage: failure.errorMessage));
          } else {
            emit(GetAllOrdersFailure(errMessage: failure.errorMessage));
          }
        }, (success) {
          hasNext = success['has_next'];
          orders = success['orders'];
          if (hasNext) {
            page++;
          }
          emit(GetAllOrdersSuccess(orders: orders));
        });
      } catch (e) {
        if (fromPagination) {
          emit(GetAllOrdersPaginationFailure(errMessage: e.toString()));
        } else {
          emit(GetAllOrdersFailure(errMessage: e.toString()));
        }
      }
    } on StateError catch (e) {
      log('e: $e');
    }
  }
}
