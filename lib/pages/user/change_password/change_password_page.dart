import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/style_text.dart';
import 'package:seafoods/helpers/image_helper.dart';
import 'package:seafoods/pages/loginandsignup/login/login.dart';
import 'package:seafoods/pages/user/change_password/change_pass_presenter.dart';
import 'package:seafoods/pages/user/change_password/change_pass_viewcontact.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key, required this.customer_email});
  final String customer_email;
  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage>
    implements ChangePassViewContact {
  final textControllerPass1 = TextEditingController();
  final textControllerPass2 = TextEditingController();
  ChangePassPresenter? changePassPresenter;
  bool isShowPass = false;
  bool isPassword = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changePassPresenter = ChangePassPresenter(changePassViewContact: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
          Center(
              child: ImageHelper.loadFromAsset("assets/images/changepass.png",
                  width: 100)),
          SizedBox(
            height: 20,
          ),
          Text(
            "Your a password",
            style: AppText.textBold.copyWith(fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: AppColor.mainColor, width: 0.9)),
              child: TextField(
                obscureText: isShowPass ? false : true,
                controller: textControllerPass1,
                autofocus: false,
                style: TextStyle(color: Colors.black, fontSize: 16),
                decoration: InputDecoration(
                    hintText: "Enter the password 1",
                    focusColor: null,
                    border: InputBorder.none,
                    // icon: Icon(Icons.remove_red_eye_outlined),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isShowPass = !isShowPass;
                          });
                        },
                        child: Icon(isShowPass
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    suffixIconColor: AppColor.mainColor,
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                    fillColor: null),
                cursorColor: AppColor.mainColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Confirm password",
            style: AppText.textBold.copyWith(fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                      color: isPassword ? AppColor.mainColor : Colors.redAccent,
                      width: 0.9)),
              child: TextField(
                obscureText: isShowPass ? false : true,
                controller: textControllerPass2,
                autofocus: false,
                onChanged: (value) {
                  if (value != textControllerPass1.text) {
                    setState(() {
                      isPassword = false;
                    });
                  } else {
                    setState(() {
                      isPassword = true;
                    });
                  }
                },
                style: TextStyle(color: Colors.black, fontSize: 16),
                decoration: InputDecoration(
                    hintText: "Enter the password 2",
                    focusColor: null,
                    border: InputBorder.none,

                    // icon: Icon(Icons.remove_red_eye_outlined),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isShowPass = !isShowPass;
                          });
                        },
                        child: Icon(isShowPass
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    suffixIconColor: AppColor.mainColor,
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                    fillColor: null),
                cursorColor: AppColor.mainColor,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          if (!isPassword)
            Text(
              "Mật khẩu xác nhận không giống nhau",
              style: TextStyle(color: Colors.redAccent),
            ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              if (textControllerPass1.text == textControllerPass2.text) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColor.mainColor,
                      ),
                    );
                  },
                );
                changePassPresenter!.getChangePass(
                    widget.customer_email, textControllerPass1.text);
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  color: AppColor.mainColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 1),
                        blurRadius: 2)
                  ],
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Text(
                    "Change password",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void changePassError() {
    // TODO: implement changePassError
  }

  @override
  void changePassSuccess() {
    Navigator.of(context).canPop();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
    CherryToast.success(title: Text("Đổi mật khẩu thành công")).show(context);
  }
}
