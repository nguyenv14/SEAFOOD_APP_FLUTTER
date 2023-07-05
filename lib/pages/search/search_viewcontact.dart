import 'package:seafoods/model/category.dart';
import 'package:seafoods/model/product.dart';

abstract class SearchViewContact {
  void getCategorySuccess(List<CategoryModel> categoryList);
  void getCategoryError(Object? object);

  void getPriceMinAndMaxSuccess(List<Product> productList);
  void getPriceMinAndMaxError(Object? object);
  void getProductSearchSuccess(List<Product> productList);
  void getProductSearchError(Object? object);
}
