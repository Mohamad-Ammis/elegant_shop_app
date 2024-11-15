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
      {required List<CartProductModel> cartProducts}) {
    totalPrice = 0;
    subTotal = 0;
    totlaDiscount = 0;
    num tempTotalPrice = 0;
    for (var i = 0; i < cartProducts.length; i++) {
      //جبت سعر المنتج وكميتو لسهل العمليات عحالي
      num tempPrice = cartProducts[i].product!.price!;
      num tempQuantity = cartProducts[i].quantity!;
      String tempDiscount = '0';
      //فرضت الخصم واحد مشان اذا قسمت عليه مايصير شي وبحال كان موجود باخد قيمتو
      if (cartProducts[i].product?.discount?.active ?? false) {
        tempDiscount = cartProducts[i].product?.discount?.percent ?? '1';
      }
      // السعر الكلي بدون اي خصومات ورح جيبو بشكل طبيعي سعر المنتج بكميتو
      tempTotalPrice += (tempQuantity * tempPrice);
      //مقدار الخصم وهو عبارة عن سعر المنتج ناقص كمية الخصم هيك منكون جبنا
      //الرقم يلي بدنا نخصمو ومنعرضو
      totlaDiscount += (tempPrice * (double.parse(tempDiscount) / 100)) *
          cartProducts[i].quantity!;
      //السعر بعد الخصم وهو السعر الكلي تقسيم نسبة الخصم وبضربو بكمية المنتج
      subTotal = tempTotalPrice - totlaDiscount;
    }
    //السعر الكلي بدون اي عمليات خصم
    totalPrice = tempTotalPrice;
    emit(CartPriceSuccess());
    return totalPrice;
  }
}
