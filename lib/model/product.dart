// class Product {
//   int? productId;
//   int? categoryId;
//   String? categoryName;
//   String? productName;
//   String? productDesc;
//   int? productPrice;
//   String? productImage;
//   String? productUnit;
//   int? productUnitSold;
//   int? productStatus;
//   int? productViewer;
//   String? productContent;
//   int? productQuantity;
//   String? productDeliveryway;
//   String? productOrigin;
//   String? productDeliciousFoods;
//   List<CommentList>? commentList;
//   String? statusOrder;
//   int? flashsaleStatus;

//   Product(
//       {this.productId,
//       this.categoryId,
//       this.categoryName,
//       this.productName,
//       this.productDesc,
//       this.productPrice,
//       this.productImage,
//       this.productUnit,
//       this.productUnitSold,
//       this.productStatus,
//       this.productViewer,
//       this.productContent,
//       this.productQuantity,
//       this.productDeliveryway,
//       this.productOrigin,
//       this.productDeliciousFoods,
//       this.commentList,
//       this.statusOrder,
//       this.flashsaleStatus});

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       productId: json['product_id'],
//       categoryId: json['category_id'],
//       categoryName: json['category_name'],
//       productName: json['product_name'],
//       productDesc: json['product_desc'],
//       productPrice: json['product_price'],
//       productImage: json['product_image'],
//       productUnit: json['product_unit'],
//       productUnitSold: json['product_unit_sold'],
//       productStatus: json['product_status'],
//       productViewer: json['product_viewer'],
//       productContent: json['product_content'],
//       productQuantity: json['product_quantity'],
//       productDeliveryway: json['product_deliveryway'],
//       productOrigin: json['product_origin'],
//       productDeliciousFoods: json['product_delicious_foods'],

//       // commentList ;
//       commentList:
//           json['commentList'].map((v) => CommentList.fromJson(v)).toList(),
//       // commentList: json['commentList'],
//       statusOrder: json['status_order'],
//       flashsaleStatus: json['flashsale_status'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['product_id'] = this.productId;
//     data['category_id'] = this.categoryId;
//     data['category_name'] = this.categoryName;
//     data['product_name'] = this.productName;
//     data['product_desc'] = this.productDesc;
//     data['product_price'] = this.productPrice;
//     data['product_image'] = this.productImage;
//     data['product_unit'] = this.productUnit;
//     data['product_unit_sold'] = this.productUnitSold;
//     data['product_status'] = this.productStatus;
//     data['product_viewer'] = this.productViewer;
//     data['product_content'] = this.productContent;
//     data['product_quantity'] = this.productQuantity;
//     data['product_deliveryway'] = this.productDeliveryway;
//     data['product_origin'] = this.productOrigin;
//     data['product_delicious_foods'] = this.productDeliciousFoods;
//     if (this.commentList != null) {
//       data['commentList'] =
//           this.commentList!.map((v) => CommentList().toJson()).toList();
//     }
//     data['status_order'] = this.statusOrder;
//     data['flashsale_status'] = this.flashsaleStatus;
//     return data;
//   }
// }

// class CommentList {
//   int? commentId;
//   String? orderCode;
//   String? commentTitle;
//   String? commentContent;
//   int? commentRateStar;
//   int? commentCustomerId;
//   String? commentCustomerName;
//   int? commentProductId;
//   String? commentDate;
//   int? commentStatus;
//   int? commentReply;

//   CommentList(
//       {this.commentId,
//       this.orderCode,
//       this.commentTitle,
//       this.commentContent,
//       this.commentRateStar,
//       this.commentCustomerId,
//       this.commentCustomerName,
//       this.commentProductId,
//       this.commentDate,
//       this.commentStatus,
//       this.commentReply});

//   factory CommentList.fromJson(Map<String, dynamic> json) {
//     return CommentList(
//       commentId: json['comment_id'],
//       orderCode: json['order_code'],
//       commentTitle: json['comment_title'],
//       commentContent: json['comment_content'],
//       commentRateStar: json['comment_rate_star'],
//       commentCustomerId: json['comment_customer_id'],
//       commentCustomerName: json['comment_customer_name'],
//       commentProductId: json['comment_product_id'],
//       commentDate: json['comment_date'],
//       commentStatus: json['comment_status'],
//       commentReply: json['comment_reply'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['comment_id'] = this.commentId;
//     data['order_code'] = this.orderCode;
//     data['comment_title'] = this.commentTitle;
//     data['comment_content'] = this.commentContent;
//     data['comment_rate_star'] = this.commentRateStar;
//     data['comment_customer_id'] = this.commentCustomerId;
//     data['comment_customer_name'] = this.commentCustomerName;
//     data['comment_product_id'] = this.commentProductId;
//     data['comment_date'] = this.commentDate;
//     data['comment_status'] = this.commentStatus;
//     data['comment_reply'] = this.commentReply;
//     return data;
//   }
// }

import 'package:seafoods/model/cart.dart';

class Product {
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

  Product(
      {this.productId,
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

  CartModel toCart() {
    return CartModel(
      customer_id: null, // Thay bằng giá trị tương ứng
      quantity: 1, // Giá trị mặc định cho số lượng
      product_price_total: productPrice ??
          0, // Giá trị tổng giá sản phẩm (mặc định là giá sản phẩm)
      productId: productId,
      categoryId: categoryId,
      categoryName: categoryName,
      productName: productName,
      productDesc: productDesc,
      productPrice: productPrice,
      productImage: productImage,
      productUnit: productUnit,
      productUnitSold: productUnitSold,
      productStatus: productStatus,
      productViewer: productViewer,
      productContent: productContent,
      productQuantity: productQuantity,
      productDeliveryWay: productDeliveryWay,
      productOrigin: productOrigin,
      productDeliciousFoods: productDeliciousFoods,
      commentList: commentList,
      statusOrder: statusOrder,
      flashSaleStatus: flashSaleStatus,
    );
  }

  Product.fromJson(Map<String, dynamic> json) {
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

  // List<dynamic> source = response['data'];
  // List<Product> listProduct = source.map((item) {
  //   List<dynamic> nestedList = item['commentList'];
  //   List<CommentList> convertedList = nestedList
  //       .map((nestedItem) => CommentList.fromJson(nestedItem))
  //       .toList();
  //   item["commentList"] = convertedList;
  //   return Product.fromJson(item);
  // }).toList();

  static List<Product> getList(List<dynamic> source) {
    List<Product> listProduct = source.map((e) => Product.fromJson(e)).toList();
    return listProduct;
  }
}

class CommentList {
  int? commentId;
  String? orderCode;
  String? commentTitle;
  String? commentContent;
  int? commentRateStar;
  int? commentCustomerId;
  String? commentCustomerName;
  int? commentProductId;
  String? commentDate;
  int? commentStatus;
  int? commentReply;

  CommentList.fromJson(Map<String, dynamic> json) {
    commentId = json['comment_id'];
    orderCode = json['order_code'];
    commentTitle = json['comment_title'];
    commentContent = json['comment_content'];
    commentRateStar = json['comment_rate_star'];
    commentCustomerId = json['comment_customer_id'];
    commentCustomerName = json['comment_customer_name'];
    commentProductId = json['comment_product_id'];
    commentDate = json['comment_date'];
    commentStatus = json['comment_status'];
    commentReply = json['comment_reply'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment_id'] = this.commentId;
    data['order_code'] = this.orderCode;
    data['comment_title'] = this.commentTitle;
    data['comment_content'] = this.commentContent;
    data['comment_rate_star'] = this.commentRateStar;
    data['comment_customer_id'] = this.commentCustomerId;
    data['comment_customer_name'] = this.commentCustomerName;
    data['comment_product_id'] = this.commentProductId;
    data['comment_date'] = this.commentDate;
    data['comment_status'] = this.commentStatus;
    data['comment_reply'] = this.commentReply;
    return data;
  }
}

class GalleryProduct {
  int? galleryProductId;
  int? productId;
  String? galleryProductName;
  String? galleryProductImage;
  String? galleryProductContent;
  String? galleryProductIamge;

  GalleryProduct({
    this.galleryProductId,
    this.productId,
    this.galleryProductName,
    this.galleryProductImage,
    this.galleryProductContent,
    this.galleryProductIamge,
  });

  GalleryProduct.fromJson(Map<String, dynamic> json) {
    galleryProductId = json["gallery_product_id"];
    productId = json["product_id"];
    galleryProductName = json["gallery_product_name"];
    galleryProductImage = json["gallery_product_image"];
    galleryProductContent = json["gallery_product_content"];
    galleryProductIamge = json["gallery_product_iamge"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gallery_product_id'] = this.galleryProductId;
    data['product_id'] = this.productId;
    data['gallery_product_name'] = this.galleryProductName;
    data['gallery_product_image'] = this.galleryProductImage;
    data['gallery_product_content'] = this.galleryProductContent;
    data['gallery_product_iamge'] = this.galleryProductIamge;
    return data;
  }
}
