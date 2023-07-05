import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/dismesions.dart';
import 'package:seafoods/Constant/style_text.dart';
import 'package:seafoods/controller/cart_provider.dart';
import 'package:seafoods/localStorage/cart_db.dart';
import 'package:seafoods/localStorage/user_save.dart';
import 'package:seafoods/model/cart.dart';
import 'package:seafoods/model/product.dart';
import 'package:seafoods/widgets/app_column.dart';
import 'package:seafoods/widgets/app_icon.dart';
import 'package:seafoods/widgets/expandable_text_widget.dart';
import 'package:seafoods/widgets/icon_and_text_widget.dart';

class PopularFoodDetail extends StatefulWidget {
  const PopularFoodDetail({super.key, required this.product});
  final Product product;
  @override
  State<PopularFoodDetail> createState() => _PopularFoodDetailState();
}

class _PopularFoodDetailState extends State<PopularFoodDetail> {
  List<GalleryProduct> galleryList = [];
  int countProduct = 1;
  bool isFavorite = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      galleryList = widget.product.galleryList!;
    });
    // Provider.of<CartProvider>(context, listen: false).fetchCart();
  }

  void incrementProductCount() {
    setState(() {
      countProduct++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final countCart = cartProvider.count; // Khai báo biến cartProvider
    return Scaffold(
      appBar: null,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // collapsedHeight: 64,
            // toolbarHeight: 64,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const AppIcon(
                    iconData: Icons.arrow_back,
                  ),
                ),
                Stack(children: [
                  const AppIcon(iconData: Icons.shopping_cart_outlined),
                  Padding(
                    padding: EdgeInsets.only(left: 30, top: 25),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.mainColor,
                      ),
                      child: Consumer<CartProvider>(
                        builder: (context, cartProvider, _) {
                          return Text(cartProvider.count.toString(),
                              style: AppText.text
                                  .copyWith(color: Colors.white, fontSize: 12));
                        },
                      ),
                    ),
                  )
                ]),
              ],
            ),
            backgroundColor: AppColor.mainColor,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                    child: Text(
                  "",
                  style: AppText.textBold,
                )),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
              ),
            ),
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(children: [
                Positioned(
                    left: 0,
                    right: 0,
                    height: 350,
                    child: PageView.builder(
                      itemCount: galleryList.length,
                      allowImplicitScrolling: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 350,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    galleryList[index].galleryProductIamge!,
                                  ))),
                        );
                      },
                    )),
              ]),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                      product_name: widget.product.productName.toString(),
                      countComment: widget.product.commentList!.length),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Danh mục: " + widget.product.categoryName.toString()),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          text: "Normal",
                          iconColor: AppColor.iconColor1),
                      IconAndTextWidget(
                          icon: Icons.location_on,
                          text: "1.7km",
                          iconColor: AppColor.mainColor),
                      IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          text: "32 min",
                          iconColor: AppColor.iconColor2),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Introduce",
                    style: AppText.textBold
                        .copyWith(color: Colors.black87, fontSize: 22),
                  ),
                  // Image.network(galleryList[1])
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                      child: ExpandableTextWidget(
                          text: Dimesions.removeHtmlTags(widget
                                  .product.productDesc! +
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source."))
                      // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source."),
                      ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(60)),
            color: AppColor.mainColor.withOpacity(0.8)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            child: Text(
              Dimesions.formatNumber(widget.product.productPrice!) + "đ",
              style: AppText.textBold
                  .copyWith(color: AppColor.iconColor2, fontSize: 20),
            ),
          ),
          Container(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                    CherryToast.success(
                      title: isFavorite
                          ? Text(
                              "Đã thêm vào yêu thích!",
                              style: TextStyle(color: Colors.white),
                            )
                          : Text("Đã xóa khỏi yêu thích!",
                              style: TextStyle(color: Colors.white)),
                      displayCloseButton: false,
                      backgroundColor: AppColor.mainColor,
                      toastPosition: Position.values[0],
                      iconWidget: Icon(
                        Icons.favorite,
                        color: isFavorite ? Colors.redAccent : Colors.black,
                      ),
                    ).show(context);
                    // BotToast.showSimpleNotification(
                    //   title: "title",
                    // );
                    // StyledToast()
                    // showToast(
                    //   'This is normal',
                    //   context: context,
                    //   axis: Axis.horizontal,
                    //   alignment: Alignment.center,
                    //   position: StyledToastPosition.bottom,
                    //   toastHorizontalMargin: 20,
                    //   fullWidth: true,
                    // );
                    // incrementProductCount();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Icon(
                      Icons.favorite_sharp,
                      color: isFavorite ? Colors.redAccent : AppColor.mainColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        elevation: 10,
                        useSafeArea: true,
                        context: context,
                        builder: (context) => StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
                              return Container(
                                // margin: EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    color: Colors.white),
                                height: 200,
                                width: double.maxFinite,
                                padding: EdgeInsets.only(
                                    left: 20, top: 20, right: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Hàu sữa Pháp",
                                          style: AppText.textBold
                                              .copyWith(fontSize: 20),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: AppColor.mainColor),
                                              child: Icon(
                                                Icons.close,
                                                color: Colors.white,
                                              )),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 6),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(children: [
                                            GestureDetector(
                                              onTap: () {
                                                // handleCountProduct(0);
                                                setState(() {
                                                  countProduct--;
                                                });
                                                // incrementProductCount();
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                size: 30,
                                                color: AppColor.mainColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 5),
                                                decoration: BoxDecoration(
                                                    color: Colors.black26,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Text(
                                                  "$countProduct",
                                                  style:
                                                      AppText.textBold.copyWith(
                                                    fontSize: 16,
                                                  ),
                                                )),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                // handleCountProduct(1);
                                                setState(() {
                                                  countProduct++;
                                                });
                                              },
                                              child: Icon(
                                                Icons.add,
                                                size: 30,
                                                color: AppColor.mainColor,
                                              ),
                                            ),
                                          ]),
                                        ),
                                        Expanded(child: Container()),
                                        Text(
                                          Dimesions.formatNumber((countProduct *
                                                  widget
                                                      .product.productPrice!)) +
                                              "đ",
                                          style: AppText.textBold.copyWith(
                                              color: AppColor.iconColor2),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        CartModel cartModel =
                                            widget.product.toCart();
                                        cartModel.customer_id =
                                            CustomerDB.getCustomer()!
                                                .customer_id;
                                        cartModel.quantity = countProduct;
                                        cartModel.product_price_total =
                                            widget.product.productPrice! *
                                                countProduct;
                                        // print(GetStorage()
                                        //     .read(Dimesions.CART)
                                        //     .toString());
                                        int result = cartProvider
                                            .addProductToCart(cartModel);
                                        // cartProvider.countCarrt();
                                        Navigator.of(context).pop();
                                        if (result == 1) {
                                          CherryToast.success(
                                                  title: Text(
                                                      "Đã thêm sản phẩm ${widget.product.productName} vào giỏ hàng"))
                                              .show(context);
                                        } else {
                                          CherryToast.error(
                                                  title: Text(
                                                      "${widget.product.productName} đã tồn tại trong giỏ hàng"))
                                              .show(context);
                                        }
                                      },
                                      child: Container(
                                          // alignment: Alignment.center,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          decoration: BoxDecoration(
                                              color: AppColor.mainColor,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black45,
                                                    offset: Offset(2, 1),
                                                    blurRadius: 2)
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.shopping_cart_outlined,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Add to cart",
                                                style: AppText.textBold
                                                    .copyWith(
                                                        color: Colors.white),
                                              )
                                            ],
                                          )),
                                    )
                                  ],
                                ),
                              );
                            }));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: AppColor.mainColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  // Widget _buildBottomSheet(StateSetter stateSetter) {
  //   return Container(
  //     // margin: EdgeInsets.only(bottom: 20),
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(20), topRight: Radius.circular(20)),
  //         color: Colors.white),
  //     height: 200,
  //     width: double.maxFinite,
  //     padding: EdgeInsets.only(left: 20, top: 20, right: 20),
  //     child: Column(
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               "Hàu sữa Pháp",
  //               style: AppText.textBold.copyWith(fontSize: 20),
  //             ),
  //             GestureDetector(
  //               onTap: () {
  //                 Navigator.pop(context);
  //               },
  //               child: Container(
  //                   padding: EdgeInsets.all(5),
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(20),
  //                       color: AppColor.mainColor),
  //                   child: Icon(
  //                     Icons.close,
  //                     color: Colors.white,
  //                   )),
  //             )
  //           ],
  //         ),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         Row(
  //           children: [
  //             Container(
  //               padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
  //               decoration: BoxDecoration(
  //                   border: Border.all(color: AppColor.mainColor, width: 2),
  //                   borderRadius: BorderRadius.circular(10)),
  //               child: Row(children: [
  //                 GestureDetector(
  //                   onTap: () {
  //                     // handleCountProduct(0);
  //                     stateSetter(() {
  //                       countProduct--;
  //                     });
  //                     incrementProductCount();
  //                   },
  //                   child: Icon(
  //                     Icons.remove,
  //                     size: 30,
  //                     color: AppColor.mainColor,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   width: 10,
  //                 ),
  //                 Container(
  //                     padding:
  //                         EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //                     decoration: BoxDecoration(
  //                         color: Colors.black26,
  //                         borderRadius: BorderRadius.circular(50)),
  //                     child: Text(
  //                       "$countProduct",
  //                       style: AppText.textBold.copyWith(
  //                         fontSize: 16,
  //                       ),
  //                     )),
  //                 SizedBox(
  //                   width: 10,
  //                 ),
  //                 GestureDetector(
  //                   onTap: () {
  //                     // handleCountProduct(1);
  //                     setState(() {
  //                       countProduct++;
  //                     });
  //                   },
  //                   child: Icon(
  //                     Icons.add,
  //                     size: 30,
  //                     color: AppColor.mainColor,
  //                   ),
  //                 ),
  //               ]),
  //             ),
  //             Expanded(child: Container()),
  //             Text(
  //               (countProduct * 2000000).toString() + "đ",
  //               style: AppText.textBold.copyWith(color: AppColor.iconColor2),
  //             )
  //           ],
  //         ),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         GestureDetector(
  //           child: Container(
  //               // alignment: Alignment.center,
  //               margin: EdgeInsets.symmetric(horizontal: 10),
  //               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //               decoration: BoxDecoration(
  //                   color: AppColor.mainColor,
  //                   boxShadow: [
  //                     BoxShadow(
  //                         color: Colors.black45,
  //                         offset: Offset(2, 1),
  //                         blurRadius: 2)
  //                   ],
  //                   borderRadius: BorderRadius.circular(10)),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Icon(
  //                     Icons.shopping_cart_outlined,
  //                     color: Colors.white,
  //                   ),
  //                   SizedBox(
  //                     width: 10,
  //                   ),
  //                   Text(
  //                     "Add to cart",
  //                     style: AppText.textBold.copyWith(color: Colors.white),
  //                   )
  //                 ],
  //               )),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
