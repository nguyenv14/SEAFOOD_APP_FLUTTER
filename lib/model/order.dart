import 'package:seafoods/model/comment.dart';
import 'package:seafoods/model/order_detail.dart';
import 'package:seafoods/model/payment.dart';
import 'package:seafoods/model/shipping.dart';

class Order {
  int? orderId;
  int? customerId;
  int? shippingId;
  int? paymentId;
  int? orderStatus;
  String? orderCode;
  int? productFee;
  String? productCoupon;
  int? productPriceCoupon;
  int? totalPrice;
  int? totalQuantity;
  String? orderDate;
  Shipping? shipping;
  Payment? payment;
  CommentProduct? comment;
  // List<CommentProduct>? comment;
  List<OrderDetail>? orderDetails;
  String? createdAt;
  String? updatedAt;

  Order({
    required this.orderId,
    required this.customerId,
    required this.shippingId,
    required this.paymentId,
    required this.orderStatus,
    required this.orderCode,
    required this.productFee,
    required this.productCoupon,
    required this.productPriceCoupon,
    required this.totalPrice,
    required this.totalQuantity,
    required this.orderDate,
    required this.shipping,
    required this.payment,
    required this.comment,
    required this.orderDetails,
    required this.createdAt,
    required this.updatedAt,
  });

  Order.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'] ?? 0;
    customerId = json['customer_id'] ?? 0;
    shippingId = json['shipping_id'] ?? 0;
    paymentId = json['payment_id'] ?? 0;
    orderStatus = json['order_status'] ?? 0;
    orderCode = json['order_code'];
    productFee = json['product_fee'] ?? 0;
    productCoupon = json['product_coupon'];
    productPriceCoupon = json['product_price_coupon'] ?? 0;
    totalPrice = json['total_price'] ?? 0;
    totalQuantity = json['total_quantity'] ?? 0;
    orderDate = json['order_date'];
    shipping = Shipping.fromJson(json['shipping']);
    payment = Payment.fromJson(json['payment']);
    // comment = null;
    // if (orderStatus == 4) {
    //   comment = CommentProduct.fromJson(json['comment']) as CommentProduct;
    // }
    // comment = null;
    // print(json['comment']);
    if (json['comment'] != null) {
      comment = CommentProduct.fromJson(json['comment']);
    }
    print(comment.toString());
    // comment = json['comment'] != null
    //   //     ? CommentProduct.fromJson(json['comment'])
    //     : null;
    //   //     ? CommentProduct.fromJson(json['comment'])
    // if (json['comment'] != null) {
    //   if (json['comment'] is Map<String, dynamic>) {
    //     comment = CommentProduct.fromJson(json['comment']);
    //   }
    // } else {
    //   comment = null!;
    // }
    //     : null;
    // print(json['comment']);
    // if (json['comment'] != null && json['comment'] is List<dynamic>) {
    //   comment = <CommentProduct>[];
    //   json['comment'].forEach((gallery) {
    //     comment!.add(CommentProduct.fromJson(gallery));
    //   });
    // }
    if (json['orderDetails'] != null) {
      orderDetails = <OrderDetail>[];
      json['orderDetails'].forEach((gallery) {
        orderDetails!.add(OrderDetail.fromJson(gallery));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
