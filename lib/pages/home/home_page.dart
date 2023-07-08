import 'package:flutter/material.dart';
import 'package:seafoods/model/product.dart';
import 'package:seafoods/pages/container/app_bar_widget.dart';
import 'package:seafoods/pages/home/food_page_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> listProduct = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loadProduct();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      implementBack: false,
      implementCart: true,
      scaffoldKey: _scaffoldKey,
      titleString: "Seafood1",
      child: Column(
        children: [
          Expanded(child: SingleChildScrollView(child: FoodPageBody())),
        ],
      ),
    );
    // return Scaffold(
    //   appBar: null,
    //   backgroundColor: Colors.black12.withOpacity(0.05),
    //   body: Column(
    //     children: [
    //       Container(
    //         margin: EdgeInsets.only(top: 40, bottom: 15),
    //         padding: EdgeInsets.only(left: 20, right: 20),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Column(
    //               children: [
    //                 Text(
    //                   "Vietnam",
    //                   style: AppText.textBold
    //                       .copyWith(color: AppColor.mainColor, fontSize: 20),
    //                 ),
    //                 Row(
    //                   children: [
    //                     Text("Da Nang",
    //                         style: AppText.text.copyWith(
    //                             color: AppColor.textColor, fontSize: 12)),
    //                     Icon(Icons.arrow_drop_down_rounded)
    //                   ],
    //                 ),
    //               ],
    //             ),
    //             Center(
    //               child: Container(
    //                 width: 45,
    //                 height: 45,
    //                 child: Icon(
    //                   Icons.search,
    //                   color: Colors.white,
    //                 ),
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(15),
    //                     color: AppColor.mainColor),
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //       Expanded(child: SingleChildScrollView(child: FoodPageBody())),
    //     ],
    //   ),
    // );
  }
}
