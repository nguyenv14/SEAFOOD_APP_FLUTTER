import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seafoods/Constant/dismesions.dart';
import 'package:seafoods/localStorage/user_save.dart';
import 'package:seafoods/model/cart.dart';

class CartProvider extends ChangeNotifier {
  final box = GetStorage();

  List<CartModel> _cartList = [];
  List<CartModel> get cartList => _cartList;
  CartProvider() {
    // Khởi tạo danh sách sản phẩm từ Get Storage khi Provider được tạo
    _cartList = CartModel.getListCart(box.read(Dimesions.CART));
  }

  int addProductToCart(CartModel cartModel) {
    if (_cartList.length > 0) {
      CartModel? cartFind = cartList.firstWhere(
          (element) =>
              element.productId == cartModel.productId &&
              element.customer_id == CustomerDB.getCustomer()!.customer_id,
          orElse: () => CartModel());
      // print(cartFind.productName);
      if (cartFind.productName != null) {
        return 0;
      }
    }
    // print(cartModel.toJson());
    _cartList.add(cartModel);
    // List<dynamic> dynamicNew = CartModel.getListDynamic(cartList);
    // box.write(Dimesions.CART, dynamicNew);
    // print(box.read(Dimesions.CART));
    // print(_cartList[1].toJson());
    box.write(Dimesions.CART, CartModel.getListDynamic(_cartList));
    notifyListeners();
    return 1;
  }

  int updateCart(int productId, int customerId, int quantity) {
    if (quantity < 1) {
      return 0;
    }
    if (quantity > 20) {
      return -1;
    }
    int index = _cartList.indexWhere((element) =>
        element.customer_id == customerId && element.productId == productId);
    print("quá nguu: " + index.toString());
    _cartList[index].quantity = quantity;
    _cartList[index].product_price_total =
        _cartList[index].productPrice! * quantity;
    box.write(Dimesions.CART, CartModel.getListDynamic(_cartList));
    notifyListeners();
    return 1;
  }

  void removeProductToCart(CartModel cartModel) {
    // _cartList.remove(cartModel);
    // List<dynamic> source = box.read(Dimesions.CART);
    // List<CartModel> cartList = CartModel.getListCart(source);
    // cartList.remove(cartModel);
    _cartList.removeWhere((item) =>
        item.productId == cartModel.productId &&
        item.customer_id == cartModel.customer_id);
    // print("object1");
    List<dynamic> newDynamic = CartModel.getListDynamic(_cartList);
    box.write(Dimesions.CART, newDynamic);
    // box.write(Dimesions.CART, _cartList);
    notifyListeners();
  }

  // final box = GetStorage();
  //   final storedCategories = box.read<List<CartModel>>(Dimesions.CART);
  //   if (storedCategories != null) {
  //     storedCategories.add(cart);
  //   } else {
  //     List<CartModel> cartList = [cart];
  //     box.write(Dimesions.CART, cartList);
  //   }
  // }

  // static List<CartModel>? getCart() {
  //   final box = GetStorage();
  //   final storedCategories = box.read<List<CartModel>>(Dimesions.CART);
  //   if (storedCategories != null) {
  //     return storedCategories;
  //   }
  // }

  // static void updateCart(int product_id, int customer_id, int quantity) {
  //   final box = GetStorage();
  //   final storedCategories = box.read<List<CartModel>>(Dimesions.CART);
  //   if (storedCategories != null) {
  //     int index = storedCategories.indexWhere((element) =>
  //         element.customer_id == customer_id &&
  //         element.productId == product_id);
  //     // cartModel.
  //     storedCategories[index].quantity = quantity;
  //     storedCategories[index].product_price_total =
  //         storedCategories[index].productPrice! * quantity;
  //     box.write(Dimesions.CART, storedCategories);
  //   }
  // }

  // static double? getTotalPriceCart() {
  //   final box = GetStorage();
  //   final storedCategories = box.read<List<CartModel>>(Dimesions.CART);
  //   if (storedCategories != null) {
  //     double price = 0;
  //     for (CartModel cart in storedCategories) {
  //       price = price + cart.product_price_total!;
  //     }
  //     return price;
  //   } else {
  //     return 0;
  //   }
  // }
}
