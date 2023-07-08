import 'dart:convert';

import 'package:seafoods/api/api_link_util.dart';
import 'package:seafoods/api/api_service.dart';
import 'package:seafoods/pages/user/change_password/change_pass_viewcontact.dart';
import 'package:http/http.dart' as http;

class ChangePassPresenter {
  ChangePassViewContact changePassViewContact;
  ChangePassPresenter({required this.changePassViewContact});
  void getChangePass(String customerEmail, String customerPass) async {
    var body = {
      "customer_email": customerEmail,
      "customer_password": customerPass
    };

    try {
      var resBody = await http.post(ApiUrls().API_CHANGE_PASS, body: body);
      var response = jsonDecode(resBody.body);
      if (response["status_code"] == 200) {
        changePassViewContact.changePassSuccess();
      } else {
        changePassViewContact.changePassError();
      }
    } catch (e) {
      print(e);
      changePassViewContact.changePassError();
    }
  }
}
