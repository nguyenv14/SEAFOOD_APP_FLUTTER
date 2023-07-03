class CommentProduct {
  int? idCommentProduct;
  int? productId;
  int? customerId;
  String titleComment;
  String contentComment;
  String createdAt;

  CommentProduct({
    required this.idCommentProduct,
    required this.productId,
    required this.customerId,
    required this.titleComment,
    required this.contentComment,
    required this.createdAt,
  });

  factory CommentProduct.fromJson(Map<String, dynamic> json) {
    return CommentProduct(
      idCommentProduct: json['id_comment_product'] ?? 0,
      productId: json['product_id'] ?? 0,
      customerId: json['customer_id'] ?? 0,
      titleComment: json['title_comment'] ?? '',
      contentComment: json['content_comment'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_comment_product': idCommentProduct,
      'product_id': productId,
      'customer_id': customerId,
      'title_comment': titleComment,
      'content_comment': contentComment,
      'created_at': createdAt,
    };
  }
}
