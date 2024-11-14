import 'package:elegant_shop_app/features/home/data/models/product_model.dart';

class CartProductModel {
  int? id;
  ProductModel? product;
  int? user;
  int? quantity;

  CartProductModel({this.id, this.product, this.user, this.quantity});

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['id'] as int?,
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      user: json['user'] as int?,
      quantity: json['quantity'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product?.toJson(),
        'user': user,
        'quantity': quantity,
      };
}
