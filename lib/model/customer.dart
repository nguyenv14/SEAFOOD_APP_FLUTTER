class Customer {
  int? customer_id;
  String? customer_name;
  int? customer_phone;
  String? customer_email;
  String? customer_password;

  Customer({
    this.customer_id,
    this.customer_name,
    this.customer_phone,
    this.customer_email,
    this.customer_password,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      customer_id: json['customer_id'],
      customer_name: json['customer_name'],
      customer_phone: json['customer_phone'],
      customer_email: json['customer_email'],
      customer_password: json['customer_password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customer_id': customer_id,
      'customer_name': customer_name,
      'customer_phone': customer_phone,
      'customer_email': customer_email,
      'customer_password': customer_password,
    };
  }
}
