import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:seafoods/helpers/asset_helper.dart';
import 'package:seafoods/helpers/image_helper.dart';
import 'package:seafoods/pages/home/main_page.dart';
import 'package:seafoods/pages/home/welcome_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences sharedPreferences;
  void setFirstApp() async {
    sharedPreferences = await SharedPreferences.getInstance();
    bool isFirst = sharedPreferences.getBool("FirstApp") ?? false;
    print(isFirst);
    if (isFirst == true) {
      await Future.delayed(const Duration(seconds: 2));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    } else {
      await sharedPreferences.setBool("FirstApp", true);
      await Future.delayed(const Duration(seconds: 2));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WelcomePage()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setFirstApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageHelper.loadFromAsset("assets/images/background1.jpg",
                fit: BoxFit.fitHeight),
          ),
          Center(
            child: Lottie.asset(
              'assets/raw/foodlogo.json', // Đường dẫn tới file JSON của animation
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
