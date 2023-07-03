class Shipping {
  int shippingId;
  String shippingName;
  String shippingEmail;
  int shippingPhone;
  String shippingAddress;
  String shippingNotes;
  int shippingSpecialRequirements;
  int shippingReceipt;
  String createdAt;
  String updatedAt;

  Shipping({
    required this.shippingId,
    required this.shippingName,
    required this.shippingEmail,
    required this.shippingPhone,
    required this.shippingAddress,
    required this.shippingNotes,
    required this.shippingSpecialRequirements,
    required this.shippingReceipt,
    required this.createdAt,
    required this.updatedAt,
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
}
