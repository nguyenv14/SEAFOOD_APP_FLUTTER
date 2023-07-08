import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seafoods/Constant/dismesions.dart';
import 'package:seafoods/localStorage/user_save.dart';
import 'package:seafoods/model/cart.dart';

class CartProvider extends ChangeNotifier {
  final box = GetStorage();

  List<CartModel> _cartList = [];
  int _count = 0;
  double _total_price = 0;
  List<CartModel> get cartList => _cartList;
  int get count => _count;
  double get total_price => _total_price;
  CartProvider() {
    _cartList = CartModel.getListCart(box.read(Dimesions.CART) ?? []);
    _count = _cartList.length;
    _total_price = calculateTotalQuantity(_cartList);
  }

  int addProductToCart(CartModel cartModel) {
    if (_cartList.length > 0) {
      CartModel? cartFind = cartList.firstWhere(
          (element) =>
              element.productId == cartModel.productId &&
              element.customer_id == CustomerDB.getCustomer()!.customer_id,
          orElse: () => CartModel());
      if (cartFind.productName != null) {
        return 0;
      }
    }
    _cartList.add(cartModel);
    box.write(Dimesions.CART, CartModel.getListDynamic(_cartList));
    _count = _cartList.length;
    _total_price = calculateTotalQuantity(_cartList);
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
    _total_price = calculateTotalQuantity(_cartList);
    notifyListeners();
    return 1;
  }

  void removeProductToCart(CartModel cartModel) {
    _cartList.removeWhere((item) =>
        item.productId == cartModel.productId &&
        item.customer_id == cartModel.customer_id);
    List<dynamic> newDynamic = CartModel.getListDynamic(_cartList);
    box.write(Dimesions.CART, newDynamic);
    _count = _cartList.length;
    _total_price = calculateTotalQuantity(_cartList);
    notifyListeners();
  }

  void removeAll() {
    _cartList = [];
    List<dynamic> newDynamic = CartModel.getListDynamic(_cartList);
    box.write(Dimesions.CART, newDynamic);
    _count = _cartList.length;
    _total_price = 0;
    notifyListeners();
  }

  double calculateTotalQuantity(List<CartModel> cartList) {
    double totalPrice = 0;
    for (var cart in cartList) {
      totalPrice += cart.product_price_total!;
    }
    return totalPrice;
  }
}
