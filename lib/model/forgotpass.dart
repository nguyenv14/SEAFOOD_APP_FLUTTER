class ForgotPass {
  String? customerEmail;
  int? code;
  String? status;
  ForgotPass({this.customerEmail, this.code, this.status});

  factory ForgotPass.fromJson(Map<String, dynamic> json) {
    return ForgotPass(
      customerEmail: json['customer_email'] ?? '',
      code: json['code'] ?? 0,
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'customer_email': customerEmail, 'code': code, 'status': status};
  }
}
