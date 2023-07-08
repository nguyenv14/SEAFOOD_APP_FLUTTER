class Shipping {
  int? shippingId;
  String shippingName;
  String shippingEmail;
  int shippingPhone;
  String shippingAddress;
  String shippingNotes;
  int shippingSpecialRequirements;
  int shippingReceipt;
  String? createdAt;
  String? updatedAt;

  Shipping({
    this.shippingId,
    required this.shippingName,
    required this.shippingEmail,
    required this.shippingPhone,
    required this.shippingAddress,
    required this.shippingNotes,
    required this.shippingSpecialRequirements,
    required this.shippingReceipt,
    this.createdAt,
    this.updatedAt,
  });

  factory Shipping.fromJson(Map<String, dynamic> json) {
    return Shipping(
      shippingId: json['shipping_id'],
      shippingName: json['shipping_name'],
      shippingEmail: json['shipping_email'],
      shippingPhone: json['shipping_phone'],
      shippingAddress: json['shipping_address'],
      shippingNotes: json['shipping_notes'],
      shippingSpecialRequirements: json['shipping_special_requirements'],
      shippingReceipt: json['shipping_receipt'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'shipping_id': shippingId,
      'shipping_name': shippingName,
      'shipping_email': shippingEmail,
      'shipping_phone': shippingPhone,
      'shipping_address': shippingAddress,
      'shipping_notes': shippingNotes,
      'shipping_special_requirements': shippingSpecialRequirements,
      'shipping_receipt': shippingReceipt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
