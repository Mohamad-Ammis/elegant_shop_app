class Payment {
  int? amount;
  String? currency;
  String? description;
  dynamic failureReason;
  String? status;

  Payment({
    this.amount,
    this.currency,
    this.description,
    this.failureReason,
    this.status,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        amount: json['amount'] as int?,
        currency: json['currency'] as String?,
        description: json['description'] as String?,
        failureReason: json['failure_reason'] as dynamic,
        status: json['status'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'currency': currency,
        'description': description,
        'failure_reason': failureReason,
        'status': status,
      };
}
