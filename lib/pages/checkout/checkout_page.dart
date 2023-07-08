import 'dart:convert';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/dismesions.dart';
import 'package:seafoods/Constant/style_text.dart';
import 'package:seafoods/controller/cart_provider.dart';
import 'package:seafoods/helpers/image_helper.dart';
import 'package:seafoods/localStorage/user_save.dart';
import 'package:seafoods/model/cart.dart';
import 'package:seafoods/model/coupon.dart';
import 'package:seafoods/model/customer.dart';
import 'package:seafoods/model/order.dart';
import 'package:seafoods/model/payment.dart';
import 'package:seafoods/model/shipping.dart';
import 'package:seafoods/pages/checkout/checkout_presenter.dart';
import 'package:seafoods/pages/checkout/checkout_viewcontact.dart';
import 'package:seafoods/pages/checkout/receipt.dart';
import 'package:seafoods/pages/container/app_bar_widget.dart';
import 'package:seafoods/widgets/dash_line.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage>
    implements CheckoutViewContact {
  List<CartModel> cartList = [];
  List<RadioModel> paymentList = [];
  late Customer customer;
  late Coupon coupon = new Coupon();

  final scrollController = PageController();
  final nameTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final mailTextController = TextEditingController();
  final cityTextController = TextEditingController();
  final wardTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final couponTextController = TextEditingController();

  late CheckoutPresenter checkoutPresenter;

  late double total_price, price_payment, fee_ship = 30000;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkoutPresenter = CheckoutPresenter(checkoutViewContact: this);

    customer = CustomerDB.getCustomer()!;

    nameTextController.text = customer.customer_name!;
    phoneTextController.text = "0" + customer.customer_phone.toString();
    mailTextController.text = customer.customer_email!;

    setState(() {
      total_price =
          Provider.of<CartProvider>(context, listen: false).total_price;
      price_payment = total_price + fee_ship;
    });

    paymentList.add(
        new RadioModel(false, 'assets/images/money.png', 'Payment direct'));
    paymentList.add(new RadioModel(
        false, 'assets/images/paypal.png', 'Payment with PayPal'));
  }

  @override
  Widget build(BuildContext context) {
    // print(total_price);
    print(coupon.couponName);
    final _cartList = Provider.of<CartProvider>(context);
    cartList = _cartList.cartList;
    return AppBarContainerWidget(
      implementBack: true,
      titleString: "Checkout",
      isBackgroundTransperent: false,
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            DashLineWidget(),
            Consumer<CartProvider>(
              builder: (context, value, child) {
                cartList = value.cartList;
                return Container(
                  height: 120,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: PageView.builder(
                    itemCount: value.cartList.length,
                    controller: scrollController,
                    itemBuilder: (context, index) {
                      return Container(
                        // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        padding: EdgeInsets.all(10),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            cartList[index].productImage!))),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 200,
                                      child: Text(
                                        cartList[index].productName!,
                                        style: AppText.textBold.copyWith(
                                            fontSize: 20,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Icon(
                                              Icons.delivery_dining,
                                              color: AppColor.mainColor,
                                            ),
                                            Icon(
                                              Icons.payments,
                                              color: AppColor.iconColor2,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              cartList[index]
                                                  .quantity
                                                  .toString(),
                                              style: AppText.text.copyWith(
                                                  color: AppColor.mainColor,
                                                  fontSize: 15),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              Dimesions.formatNumber(cartList[
                                                          index]
                                                      .product_price_total!) +
                                                  "đ",
                                              style: AppText.text.copyWith(
                                                  color: AppColor.iconColor2,
                                                  fontSize: 15),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ])
                            ]),
                      );
                    },
                  ),
                );
              },
            ),
            SmoothPageIndicator(
              controller: scrollController,
              count: cartList.length,
              effect: ExpandingDotsEffect(
                  dotWidth: 8,
                  dotHeight: 8,
                  activeDotColor: AppColor.mainColor),
            ),
            DashLineWidget(),
            Container(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Infomation Receiver",
                      style: AppText.textBold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BuildText(
                    "Name",
                    nameTextController,
                    "Enter the name ...",
                  ),
                  BuildText("Email", mailTextController, "Enter the email ...",
                      textInputType: TextInputType.emailAddress),
                  BuildText("Phone", phoneTextController, "Enter the phone ...",
                      textInputType: TextInputType.number),
                  BuildText("City/Provice", cityTextController,
                      "Enter the city/proivce ..."),
                  Row(
                    children: [
                      Expanded(
                          child: BuildText(
                              "Address", addressTextController, "Address")),
                      Expanded(
                          child: BuildText("Ward", wardTextController, "Ward")),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Coupon",
                      style: AppText.textBold,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          // width: 100,
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black26)),
                          child: TextField(
                            controller: couponTextController,
                            style: AppText.textBold.copyWith(fontSize: 15),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter the code..."),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                checkoutPresenter
                                    .getCoupon(couponTextController.text);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 10),
                                decoration: BoxDecoration(
                                    color: AppColor.mainColor,
                                    borderRadius: BorderRadius.circular(7)),
                                child: Text(
                                  "Confirm",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (coupon.couponName != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CouponCard(
                          curveAxis: Axis.vertical,
                          height: 100,
                          firstChild: Container(
                            height: 140,
                            decoration: BoxDecoration(color: Colors.green),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                coupon.couponPriceSale! < 100
                                    ? Text(
                                        coupon.couponPriceSale.toString() +
                                            "%\nOFF",
                                        style: AppText.textBold.copyWith(
                                            color: Colors.white, fontSize: 15),
                                      )
                                    : Text(
                                        (coupon.couponPriceSale! / 1000)
                                                .toString() +
                                            "đ\nOFF",
                                        style: AppText.textBold.copyWith(
                                            color: Colors.white, fontSize: 15)),
                                DashLineWidget(),
                                Text(
                                  coupon.couponDesc!,
                                  style: AppText.textBold.copyWith(
                                      color: Colors.white, fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          secondChild: Container(
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.2),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Coupon code",
                                    style: AppText.text.copyWith(
                                        fontSize: 12, color: Colors.black54),
                                  ),
                                  Text(
                                    coupon.couponNameCode!,
                                    style: AppText.textBold.copyWith(
                                        fontSize: 16, color: Colors.green),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      "Date:" +
                                          coupon.couponStartDate! +
                                          "-" +
                                          coupon.couponEndDate!,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                    ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: DashLineWidget(),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(children: [
                      Text(
                        "Payment method",
                        style: AppText.textBold,
                      ),
                      SingleChildScrollView(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: paymentList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    paymentList.forEach((element) =>
                                        element.isSelected = false);
                                    paymentList[index].isSelected = true;
                                  });
                                },
                                child: buildSelectPayment(paymentList[index]));
                          },
                        ),
                      )
                    ]),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          "Checkout",
                          style: AppText.textBold,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total price",
                              style: AppText.textBold.copyWith(fontSize: 17),
                            ),
                            Text(
                              Dimesions.formatNumber(total_price) + "đ",
                              style: AppText.textBold.copyWith(fontSize: 15),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Fee ship",
                              style: AppText.textBold.copyWith(fontSize: 17),
                            ),
                            Text(
                              "+" + Dimesions.formatNumber(fee_ship) + "đ",
                              style: AppText.textBold.copyWith(fontSize: 15),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Coupon",
                              style: AppText.textBold.copyWith(fontSize: 17),
                            ),
                            coupon.couponName != null
                                ? RichText(
                                    text: TextSpan(
                                        text: "THEGIOIHAISAN",
                                        style: AppText.textBold.copyWith(
                                            fontSize: 15,
                                            color: Colors.redAccent),
                                        children: [
                                        coupon.couponPriceSale! > 100
                                            ? TextSpan(
                                                text: "/-" +
                                                    Dimesions.formatNumber(
                                                        coupon.couponPriceSale!
                                                            .toDouble()) +
                                                    "đ",
                                                style: AppText.textBold
                                                    .copyWith(
                                                        fontSize: 15,
                                                        color: Colors.black))
                                            : TextSpan(
                                                text: "/-" +
                                                    coupon.couponPriceSale!
                                                        .toString() +
                                                    "%",
                                                style: AppText.textBold
                                                    .copyWith(
                                                        fontSize: 15,
                                                        color: Colors.black))
                                      ]))
                                : Text("Không có",
                                    style: AppText.textBold.copyWith(
                                        fontSize: 15, color: Colors.black))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: DashLineWidget(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Payment",
                              style: AppText.textBold.copyWith(fontSize: 17),
                            ),
                            Text(
                              Dimesions.formatNumber(price_payment) + "đ",
                              style: AppText.textBold.copyWith(fontSize: 15),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: CircularProgressIndicator(
                                      color: AppColor.mainColor),
                                );
                              },
                            );
                            checkoutPayment();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(1, 1),
                                    blurRadius: 2)
                              ],
                              color: AppColor.mainColor,
                            ),
                            child: Text(
                              "Order payment",
                              style: AppText.textBold
                                  .copyWith(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  void checkoutPayment() async {
    RadioModel? radioModel = paymentList.firstWhere(
      (element) => element.isSelected == true,
      orElse: () => new RadioModel(false, "ss", "1"),
    );
    print(radioModel.text);
    if (nameTextController.text == '' ||
        mailTextController.text == '' ||
        phoneTextController.text == '' ||
        cityTextController.text == '' ||
        addressTextController.text == '' ||
        wardTextController.text == '') {
      CherryToast.warning(title: Text("Vui lòng cung cấp đầy đủ thông tin"))
          .show(context);
    } else {
      Shipping shipping = new Shipping(
        shippingName: nameTextController.text,
        shippingEmail: mailTextController.text,
        shippingPhone: int.parse(phoneTextController.text),
        shippingAddress: addressTextController.text +
            "," +
            wardTextController.text +
            "," +
            cityTextController.text,
        shippingNotes: "không có",
        shippingSpecialRequirements: 1,
        shippingReceipt: 0,
      );
      Payment payment = new Payment(paymentMethod: 4, paymentStatus: 0);
      //  var shippingJson = jsonEncode(shipping.toJson());
      // var paymentJson = jsonEncode(payment.toJson());
      // var couponJson = jsonEncode(coupon.toJson());
      // var cartListJson = jsonEncode(cartList.map((e) => e.toJson()).toList());
      if (radioModel.text == 'Payment direct') {
        checkoutPresenter.checkout(shipping, payment, coupon, cartList);
      } else if (radioModel.text == 'Payment with PayPal') {
        print("Payment with PayPal");
      } else {
        CherryToast.error(title: Text("Vui lòng chọn phương thức thanh toán"))
            .show(context);
      }
    }
  }

  Widget BuildText(String title, TextEditingController textEditingController,
      String hintText,
      {TextInputType? textInputType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            title,
            style: AppText.textBold.copyWith(fontSize: 14),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black26, width: 1),
              borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
          child: TextField(
            keyboardType: textInputType ?? TextInputType.text,
            controller: textEditingController,
            style: AppText.textBold.copyWith(fontSize: 15),
            cursorColor: AppColor.mainColor,
            decoration:
                InputDecoration(hintText: hintText, border: InputBorder.none),
          ),
        ),
      ],
    );
  }

  @override
  void getCouponError() {
    CherryToast.error(title: Text("Không tồn tại mã code. Vui lòng nhập lại!"))
        .show(context);
  }

  @override
  void getCouponSuccess(Coupon coupon) {
    CherryToast.success(title: Text("Đã thêm mã giảm giá thành công!"))
        .show(context);
    setState(() {
      this.coupon = coupon;
      if (this.coupon.couponPriceSale! < 100) {
        double coupon_price = (coupon.couponPriceSale! * total_price) / 100;
        price_payment = total_price + fee_ship - coupon_price;
      } else {
        price_payment = total_price + fee_ship - coupon.couponPriceSale!;
      }
    });
  }

  @override
  void getOrderError() {
    CherryToast.error(title: Text("Có một số lỗi xảy ra!")).show(context);
  }

  @override
  void getOrderSuccess(Order order) {
    for (CartModel cartModel in cartList) {}
    Navigator.of(context).pop();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => ReceiptPage(order: order),
        ),
        (route) => false);
    CherryToast.success(title: Text("Bạn đã đặt hàng thành công!!"))
        .show(context);
  }
}

Widget buildSelectPayment(RadioModel radioModel) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: radioModel.isSelected ? Colors.redAccent : Colors.black,
        )),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageHelper.loadFromAsset(radioModel.icon),
        SizedBox(
          width: 20,
        ),
        Text(radioModel.text)
      ],
    ),
  );
}

class RadioModel {
  bool isSelected;
  final String icon;
  final String text;

  RadioModel(this.isSelected, this.icon, this.text);
}
