import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/style_text.dart';
import 'package:seafoods/helpers/image_helper.dart';
import 'package:seafoods/model/forgotpass.dart';
import 'package:seafoods/pages/user/change_password/change_password_page.dart';

class PinCodePage extends StatefulWidget {
  const PinCodePage({super.key, required this.forgotPass});
  final ForgotPass forgotPass;
  @override
  State<PinCodePage> createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> {
  final textCotroller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(widget.forgotPass.toJson());
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Center(
              child: Image.asset(
            "assets/images/changepass.png",
            width: 200,
          )),
        ),
        Column(
          children: [
            Text(
              "Change password vetification",
              style: AppText.textBold,
            ),
            RichText(
                text: TextSpan(
                    text: "Enter the code send to: ",
                    style: AppText.text.copyWith(fontSize: 13),
                    children: [
                  TextSpan(
                      text: "nguyenvy1470@gmail.com",
                      style: AppText.textBold.copyWith(fontSize: 15))
                ]))
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
          child: Form(
            key: formKey,
            child: PinCodeTextField(
              appContext: context,
              onCompleted: (value) {
                if (value == widget.forgotPass.code.toString()) {
                  // CherryToast.success(
                  //         title: Text("Xác nhận mã code thành công!"))
                  //     .show(context);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePasswordPage(
                              customer_email:
                                  widget.forgotPass.customerEmail!)));
                } else {
                  CherryToast.warning(
                          title: Text("Vui lòng kiểm tra lại mã code!"))
                      .show(context);
                }
                print(value);
              },
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              length: 4,
              pastedTextStyle: TextStyle(
                color: AppColor.mainColor,
                fontWeight: FontWeight.bold,
              ),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
              ),
              animationDuration: const Duration(milliseconds: 100),
              enableActiveFill: false,
              autoFocus: true,
              controller: textCotroller,
              keyboardType: TextInputType.number,
              boxShadows: const [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Colors.black12,
                  blurRadius: 10,
                )
              ],
              // obscuringWidget: const FlutterLogo(
              //   size: 24,
              // ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangePasswordPage(
                  customer_email: widget.forgotPass.customerEmail!,
                ),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: AppColor.mainColor,
                boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 2)],
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "Resend",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        )
      ]),
    );
  }
}
