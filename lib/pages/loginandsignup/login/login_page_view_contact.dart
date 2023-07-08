import 'package:seafoods/model/customer.dart';
import 'package:seafoods/model/forgotpass.dart';

abstract class LoginPageViewContact {
  void loginSuccess(Customer customer);
  void loginError();
  void sendCodeSuccess(ForgotPass forgotPass);
  void sendCodeError(String e);
}
