import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seafoods/Constant/dismesions.dart';
import 'package:seafoods/localStorage/user_save.dart';
import 'package:seafoods/model/cart.dart';
import 'package:seafoods/model/category.dart';

class CartDB {
  static int saveCart(CartModel cart) {
    final box = GetStorage();
    List<dynamic> dynamicList = box.read(Dimesions.CART);
    print(dynamicList.length);
    List<CartModel> cartList = CartModel.getListCart(dynamicList);
    if (cartList.length > 0) {
      CartModel? cartFind = cartList.firstWhere(
          (element) =>
              element.productId == cart.productId &&
              element.customer_id == CustomerDB.getCustomer()!.customer_id,
          orElse: () => CartModel());
      print(cartFind.productName.toString() + "1");
      if (cartFind.productName != null) {
        return 0;
      }
    }
    cartList.add(cart);
    List<dynamic> dynamicNew = CartModel.getListDynamic(cartList);
    box.write(Dimesions.CART, dynamicNew);
    print(box.read(Dimesions.CART));
    return 1;
    // print(cartList);

    // List<CartModel> cartList = [];
    // // cartList.add(cart);
    // box.write(Dimesions.CART, cartList);
    // print(box.read(Dimesions.CART).runtimeType);
    // List<CartModel> cart1 = box.read(Dimesions.CART);
    // print(cart1.length.toString() + "nguyên");
    // List<CartModel> cartList = box.read(Dimesions.CART);
    // print((box.read(Dimesions.CART) as List<CartModel>).runtimeType);
    // if(cartList.length == 0)
    // final storedCategories = box.read(Dimesions.CART);
    // List<CartModel> cartList =
    //     storedCategories.map((e) => CartModel.fromJson(e)).toList();
    // if (cartList != null) {
    //   // print("object");
    //   cartList.add(cart);
    //   final stored = cartList.map((e) => CartModel().toJson());
    //   box.write(Dimesions.CART, stored);
    //   // print("object2");
    // } else {
    //   print("odd1");
    //   List<CartModel> cartList = [];
    //   cartList.add(cart);
    //   final source = cartList.map((e) => CartModel().toJson());
    //   box.write(Dimesions.CART, source);
    // }
  }

  static void remove() {
    final box = GetStorage();
    box.write(Dimesions.CART, null);
  }

  static void removeCart(CartModel cartModel) {
    final box = GetStorage();
    List<dynamic> source = box.read(Dimesions.CART);
    List<CartModel> cartList = CartModel.getListCart(source);
    // cartList.remove(cartModel);
    cartList.removeWhere((item) =>
        item.productId == cartModel.productId &&
        item.customer_id == cartModel.customer_id);
    print("object1");
    List<dynamic> newDynamic = CartModel.getListDynamic(cartList);
    box.write(Dimesions.CART, newDynamic);
  }

  static List<CartModel>? getCart() {
    final box = GetStorage();
    List<dynamic> storedCategories = box.read(Dimesions.CART);
    List<CartModel> cartList = CartModel.getListCart(storedCategories);
    // if (cartList.length > 0) {
    return cartList;
    // }
  }

  static void updateCart(int product_id, int customer_id, int quantity) {
    final box = GetStorage();
    final storedCategories = box.read<List<CartModel>>(Dimesions.CART);
    if (storedCategories != null) {
      int index = storedCategories.indexWhere((element) =>
          element.customer_id == customer_id &&
          element.productId == product_id);
      // cartModel.
      storedCategories[index].quantity = quantity;
      storedCategories[index].product_price_total =
          storedCategories[index].productPrice! * quantity;
      box.write(Dimesions.CART, storedCategories);
    }
  }

  static double? getTotalPriceCart() {
    final box = GetStorage();
    List<dynamic> storedCategories = box.read(Dimesions.CART);
    List<CartModel> cartList = CartModel.getListCart(storedCategories);
    if (cartList.length > 0) {
      double price = 0;
      for (CartModel cart in cartList) {
        price = price + cart.product_price_total!;
      }
      return price;
    } else {
      return 0;
    }
  }
}
