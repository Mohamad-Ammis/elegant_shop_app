import 'category.dart';
import 'discount.dart';
import 'image.dart';

class ProductDetailsModel {
  int? id;
  String? name;
  String? thumbnailUrl;
  String? absoluteUrl;
  String? description;
  Discount? discount;
  int? price;
  int? stock;
  bool? inStock;
  bool? isFavorite;
  double? avgRating;
  int? ratingCount;
  List<Image>? images;
  Category? category;

  ProductDetailsModel({
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
    this.images,
    this.category,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
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
      isFavorite: json['is_favorite'] as bool?,
      avgRating: (json['avg_rating'] as num?)?.toDouble(),
      ratingCount: json['rating_count'] as int?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
    );
  }

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
        'images': images?.map((e) => e.toJson()).toList(),
        'category': category?.toJson(),
      };
}
