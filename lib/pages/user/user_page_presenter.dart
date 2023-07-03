import 'package:seafoods/localStorage/user_save.dart';
import 'package:seafoods/pages/user/user_page_view_contact.dart';

class UserPagePresenter {
  UserPageViewContact? userPageViewContact;
  UserPagePresenter(this.userPageViewContact);

  void Logout() {
    CustomerDB.deleteCustomer();
    userPageViewContact!.logoutSuccess();
  }
}
