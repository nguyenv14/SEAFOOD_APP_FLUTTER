import 'package:seafoods/model/customer.dart';

abstract class LoginPageViewContact {
  void loginSuccess(Customer customer);
  void loginError();
}
