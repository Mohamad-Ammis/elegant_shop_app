import '../product_model.dart';

class CategoryModel {
  int? id;
  String? name;
  String? absoluteUrl;
  List<ProductModel>? products;

  CategoryModel({this.id, this.name, this.absoluteUrl, this.products});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        absoluteUrl: json['absolute_url'] as String?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'absolute_url': absoluteUrl,
        'products': products?.map((e) => e.toJson()).toList(),
      };
}
