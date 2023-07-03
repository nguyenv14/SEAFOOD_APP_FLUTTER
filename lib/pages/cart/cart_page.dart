import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/dismesions.dart';
import 'package:seafoods/Constant/style_text.dart';
import 'package:seafoods/controller/cart_provider.dart';
import 'package:seafoods/helpers/image_helper.dart';
import 'package:seafoods/localStorage/cart_db.dart';
import 'package:seafoods/localStorage/user_save.dart';
import 'package:seafoods/model/cart.dart';
import 'package:seafoods/widgets/dash_line.dart';

// class CartPage extends StatefulWidget {
//   const CartPage({super.key});

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   final _scrollController = ScrollController();
//   late CartProvider cartProvider;
//   late List<CartModel>? cartList;
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _scrollController.dispose();
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // cartProvider = Provider.of<CartProvider>(context, listen: false);
//     cartList = CartDB.getCart() ?? [];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.black12.withOpacity(0.05),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         automaticallyImplyLeading: false,
//         title: Row(
//           children: [
//             Expanded(
//               child: Center(
//                 child: Text(
//                   "My cart",
//                   style: TextStyle(color: AppColor.mainColor),
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(7),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                 color: AppColor.mainColor,
//               ),
//               child: Icon(
//                 FontAwesomeIcons.bars,
//                 color: Colors.white,
//                 size: 20,
//               ),
//             ),
//           ],
//         ),
//         centerTitle: true,
//       ),
//       body:
//           // Consumer<CartProvider>(
//           //   builder: (context, cartProvider, _) {
//           //     return Container(
//           //         child: ListView.builder(
//           //       controller: _scrollController,
//           //       itemCount: cartProvider.cartList.length,
//           //       itemBuilder: (context, index) {
//           //         return ItemCartWidget(cartProvider.cartList[index]);
//           //       },
//           //     ));
//           //   },

//           // ),
//           Container(
//               child: ListView.builder(
//         controller: _scrollController,
//         itemCount: cartList!.length ?? 0,
//         itemBuilder: (context, index) {
//           return ItemCartWidget(cartList![index]);
//         },
//       )),
//     );
//   }

//   Widget ItemCartWidget(CartModel cartModel) {
//     return Container(
//       child: Column(
//         children: [
//           SwipeActionCell(
//               key: ObjectKey(cartModel),
//               closeWhenScrolling: true,
//               isDraggable: true,
//               leadingActions: [
//                 SwipeAction(
//                     performsFirstActionWithFullSwipe: true,
//                     color: Colors.white,
//                     onTap: (CompletionHandler handler) {
//                       CartDB.removeCart(cartModel);
//                       print("haha");
//                     },
//                     content: Container(
//                       padding: EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.redAccent,
//                           boxShadow: [
//                             BoxShadow(color: Colors.redAccent, blurRadius: 10)
//                           ]),
//                       child: Icon(
//                         Icons.delete,
//                         color: Colors.white,
//                       ),
//                     ))
//               ],
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         height: 100,
//                         width: 100,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             image: DecorationImage(
//                                 fit: BoxFit.cover,
//                                 image: NetworkImage(cartModel.productImage!))),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(
//                         cartModel.productName!,
//                         style: AppText.textBold,
//                       ),
//                       Text(
//                         cartModel.categoryName!,
//                         style: AppText.text.copyWith(color: AppColor.mainColor),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         Dimesions.formatNumber(cartModel.product_price_total!) +
//                             "đ",
//                         style: AppText.text
//                             .copyWith(fontSize: 15, color: Colors.orange),
//                       )
//                     ],
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(
//                             color: AppColor.mainColor,
//                             width: 1,
//                             style: BorderStyle.solid)),
//                     child: Column(
//                       children: [
//                         Icon(
//                           Icons.add,
//                           color: AppColor.mainColor,
//                         ),
//                         Text("1"),
//                         Icon(
//                           Icons.remove,
//                           color: AppColor.mainColor,
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               )),
//           DashLineWidget(
//             color: AppColor.mainColor,
//           )
//         ],
//       ),
//     );
//   }
// }
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
    final cartProvider = Provider.of<CartProvider>(context);
    final cartLists = cartProvider.cartList;
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
              child: ListView.builder(
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
                            print("haha");
                            cartProvider.removeProductToCart(cartLists[index]);
                            CherryToast.success(
                              title: Text("Product is deleted!"),
                              toastPosition: Position.bottom,
                            ).show(context);
                          },
                          content: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.redAccent,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.redAccent, blurRadius: 10)
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
                                      image: NetworkImage(
                                          cartLists[index].productImage!))),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              cartLists[index].productName!,
                              style: AppText.textBold,
                            ),
                            Text(
                              cartLists[index].categoryName!,
                              style: AppText.text
                                  .copyWith(color: AppColor.mainColor),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              Dimesions.formatNumber(
                                      cartLists[index].product_price_total!) +
                                  "đ",
                              style: AppText.text
                                  .copyWith(fontSize: 15, color: Colors.orange),
                            )
                          ],
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColor.mainColor,
                                  width: 1,
                                  style: BorderStyle.solid)),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print(cartLists[index].toJson());
                                  int quantity = cartLists[index].quantity! + 1;
                                  int result = cartProvider.updateCart(
                                      cartLists[index].productId!,
                                      CustomerDB.getCustomer()!.customer_id!,
                                      quantity);
                                  if (result == -1) {
                                    CherryToast.error(
                                            toastPosition: Position.bottom,
                                            title: Text("Ăn chi cho lắm vậy!"))
                                        .show(context);
                                  }
                                },
                                child: Icon(
                                  Icons.add,
                                  color: AppColor.mainColor,
                                ),
                              ),
                              Text(cartLists[index].quantity.toString()),
                              GestureDetector(
                                onTap: () {
                                  int quantity = cartLists[index].quantity! - 1;
                                  int result = cartProvider.updateCart(
                                      cartLists[index].productId!,
                                      cartLists[index].customer_id!,
                                      quantity);
                                  if (result == 0) {
                                    CherryToast.error(
                                            toastPosition: Position.bottom,
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
      )),
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
                      // print("haha");
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
