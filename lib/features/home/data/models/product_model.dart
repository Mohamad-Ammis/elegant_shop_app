class ProductModel {
  int? id;
  String? name;
  String? thumbnailUrl;
  String? absoluteUrl;
  String? description;
  dynamic discount;
  num? price;
  num? stock;
  bool? inStock;
  bool? isFavorite;
  num? averageRating;
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
    this.averageRating
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        thumbnailUrl: json['thumbnail_url'] as String?,
        absoluteUrl: json['absolute_url'] as String?,
        description: json['description'] as String?,
        discount: json['discount'] as dynamic,
        price: json['price'] as num?,
        stock: json['stock'] as num?,
        inStock: json['in_stock'] as bool?,
        isFavorite: json['is_favorite'] as bool?,
        averageRating: json['avg_rating']as num?
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'thumbnail_url': thumbnailUrl,
        'absolute_url': absoluteUrl,
        'description': description,
        'discount': discount,
        'price': price,
        'stock': stock,
        'in_stock': inStock,
        'is_favorite': isFavorite,
      };
}
