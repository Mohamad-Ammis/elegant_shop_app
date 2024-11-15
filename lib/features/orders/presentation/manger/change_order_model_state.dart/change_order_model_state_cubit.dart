import 'package:bloc/bloc.dart';
import 'package:elegant_shop_app/features/orders/data/models/create_order_model/order.dart';
import 'package:meta/meta.dart';

part 'change_order_model_state_state.dart';

class ChangeOrderModelStateCubit extends Cubit<ChangeOrderModelStateState> {
  ChangeOrderModelStateCubit() : super(ChangeOrderModelStateInitial());
  void changeOrderModelState(
      {required OrderModel orderModel, required String state}) {
    orderModel.state = state;
    emit(ChangeOrderModelStateSuccess());
  }
}
