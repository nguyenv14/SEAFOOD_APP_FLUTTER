import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/style_text.dart';
import 'package:seafoods/helpers/image_helper.dart';
import 'package:seafoods/model/customer.dart';
import 'package:seafoods/pages/home/main_page.dart';
import 'package:seafoods/pages/loginandsignup/login/login_page_presenter.dart';
import 'package:seafoods/pages/loginandsignup/login/login_page_view_contact.dart';
import 'package:seafoods/widgets/dash_line.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageViewContact {
  TextEditingController textControllerMail = new TextEditingController();
  TextEditingController textControllerPass = new TextEditingController();
  late LoginPagePresenter loginPagePresenter;
  late Customer customer;

  bool isShowPass = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginPagePresenter = LoginPagePresenter(loginPageViewContact: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageHelper.loadFromAsset("assets/images/logo.jpg",
                      width: 60),
                  RichText(
                      text: TextSpan(
                          text: "SeaFood",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          children: [
                        TextSpan(
                            text: "!",
                            style: TextStyle(
                                fontSize: 24, color: AppColor.mainColor))
                      ])),
                ],
              ),
              Text(
                "Seafood - Delivery Fast",
                style: TextStyle(color: AppColor.iconColor2),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your email address",
                      style: AppText.textBold.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // margin: EdgeInsets.symmetric(horizontal: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                              color: AppColor.mainColor, width: 0.9)),
                      child: TextField(
                        controller: textControllerMail,
                        // decoration: InputDecoration(),
                        autofocus: false,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        decoration: InputDecoration(
                            hintText: "Enter the email",
                            focusColor: null,
                            border: InputBorder.none,
                            hintStyle:
                                TextStyle(color: Colors.black.withOpacity(0.3)),
                            fillColor: null),
                        cursorColor: AppColor.mainColor,
                      ),
                    ),
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
                    Container(
                      // margin: EdgeInsets.symmetric(horizontal: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                              color: AppColor.mainColor, width: 0.9)),
                      child: TextField(
                        obscureText: isShowPass ? false : true,
                        controller: textControllerPass,
                        autofocus: false,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        decoration: InputDecoration(
                            hintText: "Enter the email",
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
                            hintStyle:
                                TextStyle(color: Colors.black.withOpacity(0.3)),
                            fillColor: null),
                        cursorColor: AppColor.mainColor,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        // print("hihi");
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppColor.mainColor,
                              ),
                            );
                          },
                          barrierDismissible: false,
                        );
                        loginPagePresenter.login(
                            textControllerMail.text, textControllerPass.text);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                            color: AppColor.mainColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            Text(
                              "Continue",
                              style: TextStyle(color: Colors.white),
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
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 150,
                        height: 2,
                        decoration: BoxDecoration(
                          // color: Colors.black,
                          border: Border.all(
                            color: Colors.black.withOpacity(0.2),
                            width: 2,
                          ),
                        ),
                      ),
                      Text("or", style: AppText.text.copyWith(fontSize: 16)),
                      Container(
                        width: 150,
                        height: 2,
                        decoration: BoxDecoration(
                          // color: Colors.black,
                          border: Border.all(
                            color: Colors.black.withOpacity(0.2),
                            width: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: AppColor.mainColor, width: 0.9)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ImageHelper.loadFromAsset("assets/images/user.png"),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Can you sign up?",
                    style: AppText.textBold
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                  )
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: AppColor.mainColor, width: 0.9)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ImageHelper.loadFromAsset("assets/images/google.png"),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Sign up with Google",
                    style: AppText.textBold
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void loginError() {
    // TODO: implement loginError
    Navigator.of(context).pop();
    CherryToast.error(
      title: Text("Wrong password or email!"),
      displayCloseButton: false,
    ).show(context);
  }

  @override
  void loginSuccess(Customer customer) {
    // TODO: implement loginSuccess
    setState(() {
      this.customer = customer;
    });
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => MainPage()), (route) => false);
    CherryToast.success(title: Text("Login Success")).show(context);
  }
}
