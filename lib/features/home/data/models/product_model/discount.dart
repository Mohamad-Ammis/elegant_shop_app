class Discount {
  String? name;
  bool? active;
  String? percent;
  double? decimal;

  Discount({this.name, this.active, this.percent, this.decimal});

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
        name: json['name'] as String?,
        active: json['active'] as bool?,
        percent: json['percent'] as String?,
        decimal: (json['decimal'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'active': active,
        'percent': percent,
        'decimal': decimal,
      };
}
