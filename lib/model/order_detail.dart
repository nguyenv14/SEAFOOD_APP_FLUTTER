class OrderDetail {
  int orderDetailsId;
  String orderCode;
  int productId;
  String productName;
  int productPrice;
  String productImage;
  int categoryId;
  String categoryName;
  int productSalesQuantity;
  String createdAt;
  String updatedAt;

  OrderDetail({
    required this.orderDetailsId,
    required this.orderCode,
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.categoryId,
    required this.categoryName,
    required this.productSalesQuantity,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      orderDetailsId: json['order_details_id'],
      orderCode: json['order_code'],
      productId: json['product_id'],
      productName: json['product_name'],
      productPrice: json['product_price'],
      productImage: json['product_image'],
      categoryId: json['category_id'],
      categoryName: json['category_name'],
      productSalesQuantity: json['product_sales_quantity'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
