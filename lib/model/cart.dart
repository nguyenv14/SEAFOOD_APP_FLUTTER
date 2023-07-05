import 'package:seafoods/model/product.dart';

class CartModel {
  int? customer_id;
  int? quantity;
  double? product_price_total;
  int? productId;
  int? categoryId;
  String? categoryName;
  String? productName;
  String? productDesc;
  double? productPrice;
  String? productImage;
  String? productUnit;
  int? productUnitSold;
  int? productStatus;
  int? productViewer;
  String? productContent;
  int? productQuantity;
  String? productDeliveryWay;
  String? productOrigin;
  String? productDeliciousFoods;
  List<GalleryProduct>? galleryList;
  List<CommentList>? commentList;
  String? statusOrder;
  int? flashSaleStatus;

  CartModel(
      {this.customer_id,
      this.quantity,
      this.product_price_total,
      this.productId,
      this.categoryId,
      this.categoryName,
      this.productName,
      this.productDesc,
      this.productPrice,
      this.productImage,
      this.productUnit,
      this.productUnitSold,
      this.productStatus,
      this.productViewer,
      this.productContent,
      this.productQuantity,
      this.productDeliveryWay,
      this.productOrigin,
      this.productDeliciousFoods,
      this.commentList,
      this.statusOrder,
      this.flashSaleStatus});

  CartModel.fromJson(Map<String, dynamic> json) {
    customer_id = json['customer_id'];
    quantity = json['quantity'];
    product_price_total = json['product_price_total'];
    productId = json['product_id'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    productName = json['product_name'];
    productDesc = json['product_desc'];
    productPrice = json['product_price'].toDouble();
    productImage = json['product_image'];
    productUnit = json['product_unit'];
    productUnitSold = json['product_unit_sold'];
    productStatus = json['product_status'];
    productViewer = json['product_viewer'];
    productContent = json['product_content'];
    productQuantity = json['product_quantity'];
    productDeliveryWay = json['product_deliveryway'];
    productOrigin = json['product_origin'];
    productDeliciousFoods = json['product_delicious_foods'];
    if (json['galleryProduct'] != null) {
      galleryList = <GalleryProduct>[];
      json['galleryProduct'].forEach((gallery) {
        galleryList!.add(GalleryProduct.fromJson(gallery));
      });
    }
    if (json['commentList'] != null) {
      commentList = <CommentList>[];
      json['commentList'].forEach((comment) {
        commentList!.add(CommentList.fromJson(comment));
      });
    }
    statusOrder = json['status_order'];
    flashSaleStatus = json['flashsale_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customer_id;
    data['quantity'] = this.quantity;
    data['product_price_total'] = this.product_price_total;
    data['product_id'] = this.productId;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['product_name'] = this.productName;
    data['product_desc'] = this.productDesc;
    data['product_price'] = this.productPrice;
    data['product_image'] = this.productImage;
    data['product_unit'] = this.productUnit;
    data['product_unit_sold'] = this.productUnitSold;
    data['product_status'] = this.productStatus;
    data['product_viewer'] = this.productViewer;
    data['product_content'] = this.productContent;
    data['product_quantity'] = this.productQuantity;
    data['product_deliveryway'] = this.productDeliveryWay;
    data['product_origin'] = this.productOrigin;
    data['product_delicious_foods'] = this.productDeliciousFoods;
    if (this.galleryList != null) {
      data['galleryProduct'] =
          this.galleryList!.map((gallery) => gallery.toJson()).toList();
    }
    if (this.commentList != null) {
      data['commentList'] =
          this.commentList!.map((comment) => comment.toJson()).toList();
    }
    data['status_order'] = this.statusOrder;
    data['flashsale_status'] = this.flashSaleStatus;
    return data;
  }

  static List<CartModel> getListCart(List<dynamic> dynamicList) {
    // if (dynamicList) {
    //   return [];
    // }
    print("hhhahaha");
    List<CartModel> list =
        dynamicList.map((e) => CartModel.fromJson(e)).toList();
    return list;
  }

  static List<dynamic> getListDynamic(List<CartModel> list) {
    List<dynamic> dynamicList = list.map((e) => e.toJson()).toList();
    return dynamicList;
  }
}
