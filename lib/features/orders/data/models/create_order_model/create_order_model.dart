import 'order.dart';

class CreateOrderModel {
  OrderModel? order;
  String? clientSecret;
  String? paymentState;

  CreateOrderModel({this.order, this.clientSecret, this.paymentState});

  factory CreateOrderModel.fromJson(Map<String, dynamic> json) =>
      CreateOrderModel(
        order: json['order'] == null
            ? null
            : OrderModel.fromJson(json['order'] as Map<String, dynamic>),
        clientSecret: json['client_secret'] as String?,
        paymentState: json['payment_state'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'order': order?.toJson(),
        'client_secret': clientSecret,
        'payment_state': paymentState,
      };
}
