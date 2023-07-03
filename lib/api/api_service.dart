import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seafoods/api/api_link_util.dart';
import 'package:seafoods/model/model.dart';

class ApiClient {
  static Future<Models> getListProdcut(Uri uri) async {
    try {
      var res = await http.get(uri);
      var response = jsonDecode(res.body);
      Models model = Models.fromJson(response);
      return model;
    } catch (e) {
      print(e);
    }
    return null!;
  }

  static Future<Model> getModel(Uri uri, Map<Object?, Object> body) async {
    try {
      // var body = {
      //   "product_id" : 1,
      // };
      var res = await http.post(uri, body: body);
      var response = jsonDecode(res.body);
      Model model = Model.fromJson(response);
      return model;
    } catch (e) {
      print(e);
    }
    return null!;
  }

  static Future<Models> getModels(Uri uri, Map<Object?, Object> body) async {
    try {
      // var body = {
      //   "product_id" : 1,
      // };
      var res = await http.post(uri, body: body);
      var response = jsonDecode(res.body);
      Models model = Models.fromJson(response);
      return model;
    } catch (e) {
      print(e);
    }
    return null!;
  }

  // static Future<Model> getProductTrending() async {
  //   try {
  //     var res = await http.get(ApiUrls().API_PRODUCT_LIST_TRENDING);
  //     var response = jsonDecode(res.body);
  //     Model model = Model.fromJson(response);
  //     return model;
  //   } catch (e) {
  //     print(e);
  //   }
  //   return null!;
  // }

  static Future<Model> getListObject(Uri uri) async {
    try {
      var res = await http.get(uri);
      var response = jsonDecode(res.body);
      Model model = Model.fromJson(response);
      return model;
    } catch (e) {
      print(e);
    }
    return null!;
  }
}
