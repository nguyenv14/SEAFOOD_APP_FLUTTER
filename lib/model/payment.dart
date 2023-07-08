class Payment {
  int? paymentId;
  int paymentMethod;
  int paymentStatus;

  Payment({
    this.paymentId,
    required this.paymentMethod,
    required this.paymentStatus,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      paymentId: json['payment_id'],
      paymentMethod: json['payment_method'],
      paymentStatus: json['payment_status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'payment_id': paymentId,
      'payment_method': paymentMethod,
      'payment_status': paymentStatus,
    };
  }
}
