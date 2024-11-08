import 'package:elegant_shop_app/features/home/data/models/product_model.dart';

// import 'product.dart';

class FavoriteProductModel {
  int? id;
  int? user;
  ProductModel? product;

  FavoriteProductModel({this.id, this.user, this.product});

  factory FavoriteProductModel.fromJson(Map<String, dynamic> json) {
    return FavoriteProductModel(
      id: json['id'] as int?,
      user: json['user'] as int?,
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user': user,
        'product': product?.toJson(),
      };
}
