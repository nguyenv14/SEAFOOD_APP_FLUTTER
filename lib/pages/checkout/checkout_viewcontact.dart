import 'package:seafoods/model/coupon.dart';
import 'package:seafoods/model/order.dart';

abstract class CheckoutViewContact {
  void getCouponSuccess(Coupon coupon);
  void getCouponError();

  void getOrderSuccess(Order order);
  void getOrderError();
}
