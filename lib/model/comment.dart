// class CommentProduct {
//   int? idCommentProduct;
//   int? productId;
//   int? customerId;
//   String titleComment;
//   String contentComment;
//   String createdAt;

//   CommentProduct({
//     required this.idCommentProduct,
//     required this.productId,
//     required this.customerId,
//     required this.titleComment,
//     required this.contentComment,
//     required this.createdAt,
//   });

//   factory CommentProduct.fromJson(Map<String, dynamic> json) {
//     return CommentProduct(
//       idCommentProduct: json['id_comment_product'] ?? 0,
//       productId: json['product_id'] ?? 0,
//       customerId: json['customer_id'] ?? 0,
//       titleComment: json['title_comment'] ?? '',
//       contentComment: json['content_comment'] ?? '',
//       createdAt: json['created_at'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id_comment_product': idCommentProduct,
//       'product_id': productId,
//       'customer_id': customerId,
//       'title_comment': titleComment,
//       'content_comment': contentComment,
//       'created_at': createdAt,
//     };
//   }
// }

class CommentProduct {
  int? commentId;
  String? orderCode;
  String? commentTitle;
  String? commentContent;
  int? commentRateStar;
  int? commentCustomerId;
  String? commentCustomerName;
  int? commentProductId;
  int? commentStatus;
  int? commentReply;
  String? commentDate;

  CommentProduct({
    this.commentId,
    this.orderCode,
    this.commentTitle,
    this.commentContent,
    this.commentRateStar,
    this.commentCustomerId,
    this.commentCustomerName,
    this.commentProductId,
    this.commentStatus,
    this.commentReply,
    this.commentDate,
  });

  factory CommentProduct.fromJson(Map<String, dynamic> json) {
    return CommentProduct(
      commentId: json['comment_id'] ?? 0,
      orderCode: json['order_code'] ?? '',
      commentTitle: json['comment_title'] ?? '',
      commentContent: json['comment_content'] ?? '',
      commentRateStar: json['comment_rate_star'] ?? 0,
      commentCustomerId: json['comment_customer_id'] ?? 0,
      commentCustomerName: json['comment_customer_name'] ?? '',
      commentProductId: json['comment_product_id'] ?? 0,
      commentStatus: json['comment_status'] ?? 0,
      commentReply: json['comment_reply'] ?? 0,
      commentDate: json['comment_date'] ?? '',
    );
  }
}
