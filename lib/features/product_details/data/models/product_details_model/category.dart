class Category {
  int? id;
  String? name;
  String? absoluteUrl;

  Category({this.id, this.name, this.absoluteUrl});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        name: json['name'] as String?,
        absoluteUrl: json['absolute_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'absolute_url': absoluteUrl,
      };
}
