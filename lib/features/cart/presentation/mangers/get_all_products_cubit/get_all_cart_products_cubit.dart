import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elegant_shop_app/features/cart/data/models/cart_product_model/cart_product_model.dart';
import 'package:elegant_shop_app/features/cart/data/repos/cart_repo.dart';
import 'package:meta/meta.dart';

part 'get_all_cart_products_state.dart';

class GetAllCartProductsCubit extends Cubit<GetAllCartProductsState> {
  GetAllCartProductsCubit({required this.cartRepo})
      : super(GetAllCartProductsInitial());
  final CartRepo cartRepo;
  List<CartProductModel> cartProducts = [];
  Future<void> getAllCartProducts() async {
    try {
      emit(GetAllCartProductsLoading());
      var data = await cartRepo.getAllCartProducts();
      data.fold((failure) {
        emit(GetAllCartProductsFailure(errMessage: failure.errorMessage));
      }, (success) {
        emit(GetAllCartProductsSuccess(cartProducts: success));
        cartProducts = success;
      });
    } catch (e) {
      log('e: ${e}');
      emit(GetAllCartProductsFailure(errMessage: e.toString()));
    }
  }

  @override
  void onChange(Change<GetAllCartProductsState> change) {
    log('change: $change');
    super.onChange(change);
  }

  num calculatePrice(List<CartProductModel> cartProducts) {
    num price = 0;
    for (var i = 0; i < cartProducts.length; i++) {
      int quantity = cartProducts[i].quantity ?? 1;
      num tempPrice = cartProducts[i].product?.price ?? 1;
      price += (quantity * tempPrice);
    }
    return price;
  }
}
