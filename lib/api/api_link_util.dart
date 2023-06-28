class ApiUrls {
  static String baseURI = "http://192.168.1.34/DoAnCNWeb/api/android";
  final Uri API_PRODUCT_LIST_NEW = Uri.parse(baseURI + "/get-product");
  final Uri API_PRODUCT_LIST_TRENDING =
      Uri.parse(baseURI + "/get-trending-product");

  final Uri API_SLIDER_LIST = Uri.parse(baseURI + "/get-slider");

  final Uri API_CATEGORY_LIST = Uri.parse(baseURI + "/get-category");

  final Uri API_GET_PRODUCT_BY_CATEGORY =
      Uri.parse(baseURI + "/get-product-by-category");

  final Uri API_GET_PRODUCT_BY_CATEGORYID =
      Uri.parse(baseURI + "/get-product-by-categoryId");
}
