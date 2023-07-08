import 'package:seafoods/api/api_link_util.dart';
import 'package:seafoods/api/api_service.dart';
import 'package:seafoods/localStorage/user_save.dart';
import 'package:seafoods/model/customer.dart';
import 'package:seafoods/model/forgotpass.dart';
import 'package:seafoods/pages/loginandsignup/login/login_page_view_contact.dart';

class LoginPagePresenter {
  LoginPageViewContact loginPageViewContact;
  LoginPagePresenter({required this.loginPageViewContact});

  Future<void> login(String email, String password) async {
    var body = {"customer_email": email, "customer_password": password};
    try {
      var resBody = await ApiClient.getModel(ApiUrls().API_CHECK_LOGIN, body);
      if (resBody.status_code == 200) {
        var source = resBody.data!;
        Customer customer = Customer.fromJson(source);
        CustomerDB.saveCustomer(customer);
        loginPageViewContact.loginSuccess(customer);
      } else {
        loginPageViewContact.loginError();
      }
    } catch (e) {
      print("Login: " + e.toString());
      loginPageViewContact.loginError();
    }
  }

  Future<void> sendCode(String email) async {
    var body = {"email": email, "status": "1"};
    try {
      var resBody = await ApiClient.getModel(ApiUrls().API_SEND_CODE, body);
      if (resBody.status_code == 200) {
        var source = resBody.data!;

        loginPageViewContact.sendCodeSuccess(ForgotPass.fromJson(source));
      } else {
        loginPageViewContact.sendCodeError(resBody.message.toString());
      }
    } catch (e) {
      loginPageViewContact.sendCodeError(e.toString());
    }
  }
}
