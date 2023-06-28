import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/style_text.dart';
import 'package:seafoods/helpers/image_helper.dart';
import 'package:seafoods/widgets/dash_line.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _scrollController = ScrollController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black12.withOpacity(0.05),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "My cart",
                  style: TextStyle(color: AppColor.mainColor),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: AppColor.mainColor,
              ),
              child: Icon(
                FontAwesomeIcons.bars,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
          child: ListView.builder(
        controller: _scrollController,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ItemCartWidget(index);
        },
      )),
    );
  }

  Widget ItemCartWidget(int index) {
    return Container(
      child: Column(
        children: [
          SwipeActionCell(
              key: ObjectKey(index),
              closeWhenScrolling: true,
              isDraggable: true,
              leadingActions: [
                SwipeAction(
                    performsFirstActionWithFullSwipe: true,
                    color: Colors.white,
                    onTap: (CompletionHandler handler) {},
                    content: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.redAccent,
                          boxShadow: [
                            BoxShadow(color: Colors.redAccent, blurRadius: 10)
                          ]),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ))
              ],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      ImageHelper.loadFromAsset("assets/images/food2.jpg",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          radius: BorderRadius.circular(10)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Chinese Dise",
                        style: AppText.textBold,
                      ),
                      Text(
                        "Spicy",
                        style: AppText.text.copyWith(color: AppColor.mainColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "\$12.0",
                        style: AppText.text
                            .copyWith(fontSize: 15, color: Colors.orange),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColor.mainColor,
                            width: 1,
                            style: BorderStyle.solid)),
                    child: Column(
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColor.mainColor,
                        ),
                        Text("1"),
                        Icon(
                          Icons.remove,
                          color: AppColor.mainColor,
                        )
                      ],
                    ),
                  ),
                ],
              )),
          DashLineWidget(
            color: AppColor.mainColor,
          )
        ],
      ),
    );
  }
}
