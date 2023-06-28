import 'package:seafoods/model/category.dart';

abstract class AppbarViewContact {
  void getCategoryListSuccess(List<CategoryModel> list);
  void getCategoryListError(Object? e);
}
