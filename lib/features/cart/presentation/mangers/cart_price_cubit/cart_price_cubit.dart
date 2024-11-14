import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elegant_shop_app/features/cart/data/models/cart_product_model/cart_product_model.dart';
import 'package:meta/meta.dart';

part 'cart_price_state.dart';

class CartPriceCubit extends Cubit<CartPriceState> {
  CartPriceCubit() : super(CartPriceInitial());
  num totalPrice = 0;
  num shippingFees = 0;
  num subTotal = 0;
  num totlaDiscount = 0;
  num calculateCartProcutsPrice(
      {required List<CartProductModel> cartProducts,
      num shippingFees = 0,
      num discount = 0}) {
    totalPrice = 0;
    subTotal = 0;
    totlaDiscount = 0;
    num tempTotalPrice = 0;
    for (var i = 0; i < cartProducts.length; i++) {
      num tempPrice = cartProducts[i].product!.price!;
      num tempQuantity = cartProducts[i].quantity!;
      String tempDiscount = '1';
      if (cartProducts[i].product?.discount?.active ?? false) {
        tempDiscount = cartProducts[i].product?.discount?.percent ?? '1';
      }
      tempTotalPrice += (tempQuantity * tempPrice);
      subTotal += (tempQuantity * (tempPrice / double.parse(tempDiscount)));
      totlaDiscount += (tempPrice - (tempPrice / double.parse(tempDiscount))) *
          cartProducts[i].quantity!;
      log('this.discount: ${totlaDiscount}');
    }
    totalPrice = tempTotalPrice - shippingFees - discount;
    emit(CartPriceSuccess());
    return totalPrice;
  }
}
