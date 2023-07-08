import 'dart:convert';
import 'dart:math';

import 'package:seafoods/api/api_link_util.dart';
import 'package:seafoods/model/cart.dart';
import 'package:seafoods/model/coupon.dart';
import 'package:http/http.dart' as http;
import 'package:seafoods/model/order.dart';
import 'package:seafoods/model/payment.dart';
import 'package:seafoods/model/shipping.dart';
import 'package:seafoods/pages/checkout/checkout_viewcontact.dart';

class CheckoutPresenter {
  CheckoutViewContact checkoutViewContact;
  CheckoutPresenter({required this.checkoutViewContact});

  void getCoupon(String name_code) async {
    var body = {"coupon_name_code": name_code};
    try {
      var resBody = await http.post(ApiUrls().API_CHECK_COUPON, body: body);
      var response = jsonDecode(resBody.body);
      // print("2");
      if (response["status_code"] == 200) {
        print("23");
        checkoutViewContact.getCouponSuccess(Coupon.fromJson(response["data"]));
      } else {
        print("object");
        checkoutViewContact.getCouponError();
      }
    } catch (e) {
      print("object1");
      print(e);
      checkoutViewContact.getCouponError();
    }
  }

  void checkout(Shipping shipping, Payment payment, Coupon coupon,
      List<CartModel> cartList) async {
    // print(shippingJson);
    // print(cartListJson);
    // print(couponJson);
    // print(order_code);
    try {
      // var shippingJson = jsonEncode(shipping.toJson());
      // var paymentJson = jsonEncode(payment.toJson());
      // var couponJson = jsonEncode(coupon.toJson());
      // var cartListJson = jsonEncode(cartList.map((e) => e.toJson()).toList());
      String order_code = "ANDROID" + (Random().nextInt(10000)).toString();
      var body = {
        "shipping": jsonEncode(shipping),
        "payment": jsonEncode(payment),
        "cart": jsonEncode(cartList),
        "coupon": jsonEncode(coupon),
        "ordercode": order_code,
      };
      var res = await http.post(ApiUrls().API_CHECKOUT, body: body);
      var response = jsonDecode(res.body);
      // print(res);
      if (response["status_code"] == 200) {
        print(response["data"].toString());
        List<dynamic> source = response["data"];
        List<Order> orderList = source.map((e) => Order.fromJson(e)).toList();
        checkoutViewContact.getOrderSuccess(orderList[0]);
      }
    } catch (e) {
      print(e);
      checkoutViewContact.getOrderError();
    }
  }
}
