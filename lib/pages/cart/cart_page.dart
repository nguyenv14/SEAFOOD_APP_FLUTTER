import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/dismesions.dart';
import 'package:seafoods/Constant/style_text.dart';
import 'package:seafoods/controller/cart_provider.dart';
import 'package:seafoods/helpers/image_helper.dart';
import 'package:seafoods/localStorage/cart_db.dart';
import 'package:seafoods/localStorage/user_save.dart';
import 'package:seafoods/model/cart.dart';
import 'package:seafoods/pages/checkout/checkout_page.dart';
import 'package:seafoods/widgets/dash_line.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
    final cartProvider = Provider.of<CartProvider>(context);
    final cartLists = cartProvider.cartList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColor.mainColor,
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
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
      body:
          // Consumer<CartProvider>(
          //   builder: (context, cartProvider, _) {
          //     return Container(
          //         child: ListView.builder(
          //       controller: _scrollController,
          //       itemCount: cartProvider.cartList.length,
          //       itemBuilder: (context, index) {
          //         return ItemCartWidget(cartProvider.cartList[index]);
          //       },
          //     ));
          //   },

          // ),
          Container(
              child: cartLists.length > 0
                  ? ListView.builder(
                      // controller: _scrollController,
                      itemCount: cartLists!.length ?? 0,
                      itemBuilder: (context, index) {
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
                                        onTap: (CompletionHandler handler) {
                                          // CartDB.removeCart(cartModel);
                                          cartProvider.removeProductToCart(
                                              cartLists[index]);
                                          CherryToast.success(
                                            title: Text("Product is deleted!"),
                                            toastPosition: Position.bottom,
                                          ).show(context);
                                        },
                                        content: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.redAccent,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.redAccent,
                                                    blurRadius: 10)
                                              ]),
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          ),
                                        ))
                                  ],
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        cartLists[index]
                                                            .productImage!))),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            cartLists[index].productName!,
                                            style: AppText.textBold,
                                          ),
                                          Text(
                                            cartLists[index].categoryName!,
                                            style: AppText.text.copyWith(
                                                color: AppColor.mainColor),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            Dimesions.formatNumber(
                                                    cartLists[index]
                                                        .product_price_total!) +
                                                "đ",
                                            style: AppText.text.copyWith(
                                                fontSize: 15,
                                                color: Colors.orange),
                                          )
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColor.mainColor,
                                                width: 1,
                                                style: BorderStyle.solid)),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                int quantity =
                                                    cartLists[index].quantity! +
                                                        1;
                                                int result =
                                                    cartProvider.updateCart(
                                                        cartLists[index]
                                                            .productId!,
                                                        CustomerDB
                                                                .getCustomer()!
                                                            .customer_id!,
                                                        quantity);
                                                if (result == -1) {
                                                  CherryToast.error(
                                                          toastPosition:
                                                              Position.bottom,
                                                          title: Text(
                                                              "Ăn chi cho lắm vậy!"))
                                                      .show(context);
                                                }
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: AppColor.mainColor,
                                              ),
                                            ),
                                            Text(cartLists[index]
                                                .quantity
                                                .toString()),
                                            GestureDetector(
                                              onTap: () {
                                                int quantity =
                                                    cartLists[index].quantity! -
                                                        1;
                                                int result =
                                                    cartProvider.updateCart(
                                                        cartLists[index]
                                                            .productId!,
                                                        cartLists[index]
                                                            .customer_id!,
                                                        quantity);
                                                if (result == 0) {
                                                  CherryToast.error(
                                                          toastPosition:
                                                              Position.bottom,
                                                          title: Text(
                                                              "Rồi m định lấy tiền của shop hay chi?"))
                                                      .show(context);
                                                }
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: AppColor.mainColor,
                                              ),
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
                        ;
                      },
                    )
                  : Lottie.asset(
                      "assets/raw/empty.json",
                    )),
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColor.mainColor,
        ),
        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: AppColor.signColor,
                borderRadius: BorderRadius.circular(30)),
            child: Text(
              "Price: " +
                  Dimesions.formatNumber(cartProvider.total_price) +
                  "đ",
              style:
                  AppText.textBold.copyWith(color: Colors.white, fontSize: 16),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (cartLists.length > 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckOutPage(),
                    ));
              } else {
                CherryToast.warning(
                        title: Text("Giỏ hàng của bạn không có sản phẩm nào!"))
                    .show(context);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: cartLists.length > 0
                      ? AppColor.iconColor2
                      : AppColor.textColor,
                  borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.shopping_cart_checkout,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Check out",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget ItemCartWidget(CartModel cartModel) {
    return Container(
      child: Column(
        children: [
          SwipeActionCell(
              key: ObjectKey(cartModel),
              closeWhenScrolling: true,
              isDraggable: true,
              leadingActions: [
                SwipeAction(
                    performsFirstActionWithFullSwipe: true,
                    color: Colors.white,
                    onTap: (CompletionHandler handler) {
                      // CartDB.removeCart(cartModel);
                    },
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
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(cartModel.productImage!))),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        cartModel.productName!,
                        style: AppText.textBold,
                      ),
                      Text(
                        cartModel.categoryName!,
                        style: AppText.text.copyWith(color: AppColor.mainColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        Dimesions.formatNumber(cartModel.product_price_total!) +
                            "đ",
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
