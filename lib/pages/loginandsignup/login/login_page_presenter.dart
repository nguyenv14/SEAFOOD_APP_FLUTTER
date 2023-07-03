import 'package:seafoods/api/api_link_util.dart';
import 'package:seafoods/api/api_service.dart';
import 'package:seafoods/localStorage/user_save.dart';
import 'package:seafoods/model/customer.dart';
import 'package:seafoods/pages/loginandsignup/login/login_page_view_contact.dart';

class LoginPagePresenter {
  LoginPageViewContact loginPageViewContact;
  LoginPagePresenter({required this.loginPageViewContact});

  Future<void> login(String email, String password) async {
    var body = {"customer_email": email, "customer_password": password};
    try {
      print("1");
      var resBody = await ApiClient.getModel(ApiUrls().API_CHECK_LOGIN, body);
      if (resBody.status_code == 200) {
        print("3");
        var source = resBody.data!;
        print("4");
        Customer customer = Customer.fromJson(source);
        CustomerDB.saveCustomer(customer);
        loginPageViewContact.loginSuccess(customer);
      } else {
        print("2");
        loginPageViewContact.loginError();
      }
    } catch (e) {
      print("Login: " + e.toString());
      loginPageViewContact.loginError();
    }
  }
}
