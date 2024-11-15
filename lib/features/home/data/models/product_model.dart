import 'package:elegant_shop_app/features/home/data/models/product_model/discount.dart';
import 'package:elegant_shop_app/features/product_details/data/models/product_details_model/category.dart';

class ProductModel {
  int? id;
  String? name;
  String? thumbnailUrl;
  String? absoluteUrl;
  String? description;
  Discount? discount;
  int? price;
  int? stock;
  bool? inStock;
  dynamic isFavorite;
  double? avgRating;
  int? ratingCount;
  Category? category;

  ProductModel({
    this.id,
    this.name,
    this.thumbnailUrl,
    this.absoluteUrl,
    this.description,
    this.discount,
    this.price,
    this.stock,
    this.inStock,
    this.isFavorite,
    this.avgRating,
    this.ratingCount,
    this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        thumbnailUrl: json['thumbnail_url'] as String?,
        absoluteUrl: json['absolute_url'] as String?,
        description: json['description'] as String?,
        discount: json['discount'] == null
            ? null
            : Discount.fromJson(json['discount'] as Map<String, dynamic>),
        price: json['price'] as int?,
        stock: json['stock'] as int?,
        inStock: json['in_stock'] as bool?,
        isFavorite: json['is_favorite'] as dynamic,
        avgRating: (json['avg_rating'] as num?)?.toDouble(),
        ratingCount: json['rating_count'] as int?,
        category: json['category'] == null
            ? null
            : Category.fromJson(json['category'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'thumbnail_url': thumbnailUrl,
        'absolute_url': absoluteUrl,
        'description': description,
        'discount': discount?.toJson(),
        'price': price,
        'stock': stock,
        'in_stock': inStock,
        'is_favorite': isFavorite,
        'avg_rating': avgRating,
        'rating_count': ratingCount,
        'category': category?.toJson(),
      };
}
