class Coupon {
  int? couponId;
  String? couponName;
  String? couponNameCode;
  String? couponDesc;
  int? couponQtyCode;
  int? couponCondition;
  int? couponPriceSale;
  String? couponStartDate;
  String? couponEndDate;

  Coupon({
    this.couponId,
    this.couponName,
    this.couponNameCode,
    this.couponDesc,
    this.couponQtyCode,
    this.couponCondition,
    this.couponPriceSale,
    this.couponStartDate,
    this.couponEndDate,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) {
    return Coupon(
      couponId: json['coupon_id'] ?? 0,
      couponName: json['coupon_name'] ?? '',
      couponNameCode: json['coupon_name_code'] ?? '',
      couponDesc: json['coupon_desc'] ?? '',
      couponQtyCode: json['coupon_qty_code'] ?? 0,
      couponCondition: json['coupon_condition'] ?? 0,
      couponPriceSale: json['coupon_price_sale'] ?? 0,
      couponStartDate: json['coupon_start_date'] ?? '',
      couponEndDate: json['coupon_end_date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coupon_id': couponId,
      'coupon_name': couponName,
      'coupon_name_code': couponNameCode,
      'coupon_desc': couponDesc,
      'coupon_qty_code': couponQtyCode,
      'coupon_condition': couponCondition,
      'coupon_price_sale': couponPriceSale,
      'coupon_start_date': couponStartDate,
      'coupon_end_date': couponEndDate,
    };
  }
}
