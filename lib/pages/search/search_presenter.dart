import 'package:seafoods/api/api_link_util.dart';
import 'package:seafoods/api/api_service.dart';
import 'package:seafoods/model/category.dart';
import 'package:seafoods/model/product.dart';
import 'package:seafoods/pages/search/search_viewcontact.dart';
// import 'package:http/';

class SearchPresenter {
  SearchViewContact? _searchViewContact;
  SearchPresenter(this._searchViewContact);
  Future<void> getCategoryList() async {
    try {
      var response = await ApiClient.getListObject(ApiUrls().API_CATEGORY_LIST);
      if (response.status_code == 200) {
        List<dynamic> source = response.data!;
        _searchViewContact!
            .getCategorySuccess(CategoryModel.getListCategory(source));
      } else {
        _searchViewContact!.getCategoryError(null);
      }
    } catch (e) {
      _searchViewContact!.getCategoryError(e);
    }
  }

  void getPriceMinAndMax() async {
    try {
      var resBody =
          await ApiClient.getListObject(ApiUrls().API_GET_PRICE_MIN_AND_MAX);
      print("1");
      if (resBody.status_code == 200) {
        print("2");
        List<dynamic> source = resBody.data!;
        _searchViewContact!.getPriceMinAndMaxSuccess(Product.getList(source));
      } else {
        _searchViewContact!.getPriceMinAndMaxError(null);
      }
    } catch (e) {
      _searchViewContact!.getPriceMinAndMaxError(e);
    }
  }

  void getFilterProduct(String nameProduct, String nameCategory, int number,
      int priceMin, int priceMax) async {
    var body = {
      "product_name": nameProduct,
      "category_name": nameCategory,
      "filter_number": number.toString(),
      "priceMin": priceMin.toString(),
      "priceMax": priceMax.toString()
    };
    try {
      var resBody =
          await ApiClient.getModels(ApiUrls().API_PRODUCT_SEARCH, body);
      print(resBody.data.toString());
      if (resBody.status_code == 200) {
        print("2");
        List<dynamic> source = resBody.data!;
        _searchViewContact!.getProductSearchSuccess(Product.getList(source));
      } else {
        _searchViewContact!.getProductSearchError(null);
      }
    } catch (e) {
      print("Lỗi");
      _searchViewContact!.getProductSearchError(e);
    }
  }
}
