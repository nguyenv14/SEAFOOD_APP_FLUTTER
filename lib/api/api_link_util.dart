class ApiUrls {
  static String baseURI = "http://192.168.1.15/DoAnCNWeb/api/android";
  final Uri API_PRODUCT_LIST_NEW = Uri.parse(baseURI + "/get-product");
  final Uri API_PRODUCT_LIST_TRENDING =
      Uri.parse(baseURI + "/get-trending-product");

  final Uri API_SLIDER_LIST = Uri.parse(baseURI + "/get-slider");

  final Uri API_CATEGORY_LIST = Uri.parse(baseURI + "/get-category");

  final Uri API_GET_PRODUCT_BY_CATEGORY =
      Uri.parse(baseURI + "/get-product-by-category");

  final Uri API_GET_PRODUCT_BY_CATEGORYID =
      Uri.parse(baseURI + "/get-product-by-categoryId");
  final Uri API_CHECK_LOGIN = Uri.parse(baseURI + "/check-login");

  final Uri API_ORDER_HISTORY = Uri.parse(baseURI + "/get-order");

  final Uri API_ORDER_CANCEL = Uri.parse(baseURI + "/order-cancel");
  final Uri API_ORDER_RECEIVE = Uri.parse(baseURI + "/order-receive");
  final Uri API_ORDER_EVALUATE_INSERT =
      Uri.parse(baseURI + "/insert-evaluate-order");
}
