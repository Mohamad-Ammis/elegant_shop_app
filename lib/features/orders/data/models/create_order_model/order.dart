import 'package:elegant_shop_app/features/orders/data/models/create_order_model/payment.dart';

class OrderModel {
  int? id;
  int? owner;
  int? total;
  String? state;
  DateTime? dateAdded;
  DateTime? dateModified;
  List<Payment>? payments;
  String? clientSecret;

  OrderModel({
    this.id,
    this.owner,
    this.total,
    this.state,
    this.dateAdded,
    this.dateModified,
    this.payments,
    this.clientSecret,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    List<Payment> temp = [];
    for (var i = 0; i < json['payments'].length; i++) {
      temp.add(Payment.fromJson(json['payments'][i]));
    }
    return OrderModel(
      id: json['id'] as int?,
      owner: json['owner'] as int?,
      total: json['total'] as int?,
      state: json['state'] as String?,
      dateAdded: json['date_added'] == null
          ? null
          : DateTime.parse(json['date_added'] as String),
      dateModified: json['date_modified'] == null
          ? null
          : DateTime.parse(json['date_modified'] as String),
      payments: temp,
      clientSecret: json['client_secret'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'owner': owner,
        'total': total,
        'state': state,
        'date_added': dateAdded?.toIso8601String(),
        'date_modified': dateModified?.toIso8601String(),
        'payments': payments,
        'client_secret': clientSecret,
      };
}
