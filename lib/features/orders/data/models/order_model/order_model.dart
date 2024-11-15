import 'order.dart';

class OrderModel {
  Order? order;
  String? clientSecret;
  String? paymentState;

  OrderModel({this.order, this.clientSecret, this.paymentState});

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        order: json['order'] == null
            ? null
            : Order.fromJson(json['order'] as Map<String, dynamic>),
        clientSecret: json['client_secret'] as String?,
        paymentState: json['payment_state'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'order': order?.toJson(),
        'client_secret': clientSecret,
        'payment_state': paymentState,
      };
}
