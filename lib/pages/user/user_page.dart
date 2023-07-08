import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/style_text.dart';
import 'package:seafoods/localStorage/user_save.dart';
import 'package:seafoods/model/customer.dart';
import 'package:seafoods/pages/container/app_bar_widget.dart';
import 'package:seafoods/pages/loginandsignup/login/login.dart';
import 'package:seafoods/pages/user/change_password/change_password_page.dart';
import 'package:seafoods/pages/user/user_page_presenter.dart';
import 'package:seafoods/pages/user/user_page_view_contact.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> implements UserPageViewContact {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late UserPagePresenter userPagePresenter;
  late Customer customer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    customer = CustomerDB.getCustomer()!;
    userPagePresenter = UserPagePresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      implementBack: false,
      implementCart: true,
      scaffoldKey: _scaffoldKey,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: AppColor.mainColor,
              ),
              child: Icon(
                Icons.person,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ItemProfileWidget(
              Icons.person, AppColor.mainColor, customer.customer_name!),
          SizedBox(
            height: 20,
          ),
          ItemProfileWidget(
              Icons.location_on, AppColor.iconColor1, "My Address"),
          SizedBox(
            height: 20,
          ),
          ItemProfileWidget(Icons.checklist, Colors.redAccent, "Evaluated"),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                print("hihi");
                userPagePresenter.Logout();
              },
              child: ItemProfileWidget(
                Icons.logout,
                Colors.redAccent,
                "Log out",
              )),
        ],
      ),
    );
    // return Scaffold(
    //   appBar: null,
    //   backgroundColor: Colors.black12.withOpacity(0.03),
    //   body: Container(
    //     margin: EdgeInsets.only(top: 70),
    //     child: Column(
    //       children: [
    //         Container(
    //           alignment: Alignment.center,
    //           child: Container(
    //             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(40),
    //               color: AppColor.mainColor,
    //             ),
    //             child: Icon(
    //               Icons.person,
    //               size: 40,
    //               color: Colors.white,
    //             ),
    //           ),
    //         ),
    //         SizedBox(
    //           height: 30,
    //         ),
    //         ItemProfileWidget(
    //             Icons.person, AppColor.mainColor, "Nguyễn Văn Vĩnh Nguyên"),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         ItemProfileWidget(Icons.phone, AppColor.yellowColor, "0839519415"),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         ItemProfileWidget(
    //             Icons.mail, AppColor.iconColor2, "nguyenvy1470@gmail.com"),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         ItemProfileWidget(
    //             Icons.location_on, AppColor.iconColor1, "My Address"),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         ItemProfileWidget(Icons.checklist, Colors.redAccent, "Evaluated"),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         ItemProfileWidget(Icons.logout, Colors.redAccent, "Log out"),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget ItemProfileWidget(IconData iconData, Color iconColor, String title) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.white10, offset: Offset(3, 1), blurRadius: 2)
          ]),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(children: [
          Container(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: iconColor,
              ),
              child: Icon(
                iconData,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: AppText.textBold,
          )
        ]),
      ),
    );
  }

  @override
  void logoutSuccess() {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
    CherryToast.success(title: Text("Logout Success")).show(context);
  }
}
