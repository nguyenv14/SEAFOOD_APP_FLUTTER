import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/style_text.dart';
import 'package:seafoods/pages/cart/cart_page.dart';
import 'package:seafoods/pages/home/food_page_body.dart';
import 'package:seafoods/pages/home/home_page.dart';
import 'package:seafoods/pages/loginandsignup/login/login.dart';
import 'package:seafoods/pages/orders/order_page.dart';
import 'package:seafoods/pages/search/search_page.dart';
import 'package:seafoods/pages/user/user_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: IndexedStack(index: _currentIndex, children: [
          HomePage(),
          OrdersPage(),
          // CartPage(),
          SearchPage(),
          UserPage(),
        ]),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: AppColor.mainColor.withOpacity(1),
            boxShadow: [BoxShadow(blurRadius: 2)],
            borderRadius: BorderRadius.all(Radius.circular(120))),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.7),
            items: [
              SalomonBottomBarItem(
                  icon: Icon(Icons.house_rounded), title: Text("Home")),
              SalomonBottomBarItem(
                  icon: Icon(
                    Icons.category,
                  ),
                  title: Text("Orders")),
              SalomonBottomBarItem(
                  icon: Icon(Icons.search_rounded), title: Text("Search")),
              SalomonBottomBarItem(
                  icon: Icon(Icons.person), title: Text("User")),
            ]),
      ),
    );
  }
}
