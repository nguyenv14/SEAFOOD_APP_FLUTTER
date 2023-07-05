import 'package:flutter/material.dart';
import 'package:seafoods/helpers/image_helper.dart';
import 'package:seafoods/pages/home/main_page.dart';
import 'package:seafoods/pages/loginandsignup/login/login.dart';
import 'package:seafoods/widgets/item_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toInt();
      });
      // print(_currentPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _pageController,
          children: [
            buildItemItroScreen(
                "assets/images/intro1.jpg",
                "Seafood Delight",
                "Found a flight that matches your destination and schedule? Book it instantly.",
                Alignment.topRight),
            buildItemItroScreen(
                "assets/images/intro3.jpg",
                "Seafood Sensations",
                "Select the day, book your room. We give you "
                    "the best price.",
                Alignment.center),
            buildItemItroScreen(
                "assets/images/intro2.jpg",
                "Taste of the Sea",
                "Easy discovering new places and share these "
                    "between your friends and travel together.",
                Alignment.centerLeft),
          ],
        ),
        Positioned(
            left: 10,
            right: 10,
            bottom: 10 * 2,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                        dotWidth: 5,
                        dotHeight: 5,
                        activeDotColor: Colors.orange),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: ItemButtonWidget(
                      data: _currentPage == 2 ? "Get started" : "Next",
                      onTap: () {
                        // setState(() {
                        //   _currentPage++;
                        // });
                        print(_currentPage);
                        if (_currentPage != 2) {
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        } else {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                              (route) => false);
                        }
                      },
                    ))
              ],
            )),
      ],
    ));
  }
}

Widget buildItemItroScreen(
    String image, String title, String desc, Alignment alignment) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
          alignment: alignment,
          child: ImageHelper.loadFromAsset(image,
              width: 300, height: 400, fit: BoxFit.fitWidth)),
      const SizedBox(
        height: 10 * 2,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              desc,
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    ],
  );
}
