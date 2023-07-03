import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_connect/connect.dart';
import 'package:seafoods/api/api_link_util.dart';
import 'package:seafoods/api/api_service.dart';
import 'package:seafoods/model/order.dart';
import 'package:http/http.dart' as http;
import 'package:seafoods/model/order_detail.dart';

class OrderProvider extends ChangeNotifier {
  List<Order> _orderList = [];
  List<Order> get orderList => _orderList;

  Future<void> fetchOrders(int? customer_id, int status) async {
    var body = {
      "customer_id": customer_id.toString(),
      "order_status": status.toString()
    };
    try {
      var res = await http.post(ApiUrls().API_ORDER_HISTORY, body: body);
      var response = jsonDecode(res.body);
      if (response['status_code'] == 200) {
        List<dynamic> source = response['data'];
        _orderList = source.map((e) => Order.fromJson(e)).toList();
        notifyListeners();
      } else {
        _orderList = [];
        print("không lấy được");
      }
    } catch (e) {
      print("catch");
      print(e);
    }
    notifyListeners();
  }

  Future<void> orderCancel(String order_code) async {
    var body = {
      "order_code": order_code.toString(),
    };
    try {
      var res = await http.post(ApiUrls().API_ORDER_CANCEL, body: body);
      var response = jsonDecode(res.body);
      if (response['status_code'] == 200) {
        List<dynamic> source = response['data'];
        List<Order> order = source.map((e) => Order.fromJson(e)).toList();
        _orderList.removeWhere((element) => element.orderCode == order_code);
        notifyListeners();
      } else {
        _orderList = [];
        print("không lấy được");
      }
    } catch (e) {}
  }

  Future<void> orderReceive(String order_code) async {
    var body = {
      "order_code": order_code.toString(),
    };
    try {
      var res = await http.post(ApiUrls().API_ORDER_RECEIVE, body: body);
      var response = jsonDecode(res.body);
      if (response['status_code'] == 200) {
        List<dynamic> source = response['data'];
        List<Order> order = source.map((e) => Order.fromJson(e)).toList();
        _orderList.removeWhere((element) => element.orderCode == order_code);
        notifyListeners();
      } else {
        _orderList = [];
        print("không lấy được");
      }
    } catch (e) {}
  }
}
