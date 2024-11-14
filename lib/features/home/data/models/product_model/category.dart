class Category {
  int? id;
  String? name;
  String? icon;
  String? absoluteUrl;

  Category({this.id, this.name, this.icon, this.absoluteUrl});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        name: json['name'] as String?,
        icon: json['icon'] as String?,
        absoluteUrl: json['absolute_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
        'absolute_url': absoluteUrl,
      };
}
