import 'package:bloc/bloc.dart';
import 'package:elegant_shop_app/features/cart/data/models/cart_product_model/cart_product_model.dart';
import 'package:meta/meta.dart';

part 'cart_price_state.dart';

class CartPriceCubit extends Cubit<CartPriceState> {
  CartPriceCubit() : super(CartPriceInitial());
  num totalPrice = 0;
  num shippingFees = 0;
  num calculateCartProcutsPrice(
      {required List<CartProductModel> cartProducts,
      num shippingFees = 0,
      num discount = 0}) {
    totalPrice = 0;
    num temp = 0;
    for (var i = 0; i < cartProducts.length; i++) {
      num tempPrice = cartProducts[i].product!.price!;
      num tempQuantity = cartProducts[i].quantity!;
      temp += (tempQuantity * tempPrice);
    }
    totalPrice = temp - shippingFees - discount;
    emit(CartPriceSuccess());
    return totalPrice;
  }
}
