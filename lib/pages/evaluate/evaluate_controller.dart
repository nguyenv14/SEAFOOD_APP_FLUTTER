import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seafoods/api/api_link_util.dart';

class EvaluateController {
  static void insertEvaluate(
      String order_code, String title, String content, int star) async {
    var body = {
      "order_code": order_code,
      "comment_title": title,
      "comment_content": content,
      "comment_star": star.toString()
    };
    try {
      var res =
          await http.post(ApiUrls().API_ORDER_EVALUATE_INSERT, body: body);
      var response = jsonDecode(res.body);
      if (response['status_code'] == 200) {
        print(response["message"]);
      } else {
        print(response["message"]);
      }
    } catch (e) {
      print(e);
    }
  }
}
