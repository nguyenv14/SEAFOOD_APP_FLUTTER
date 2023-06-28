import 'package:flutter/foundation.dart';
import 'package:seafoods/api/api_link_util.dart';
import 'package:seafoods/api/api_service.dart';
import 'package:seafoods/model/category.dart';
import 'package:seafoods/pages/container/appbar_viewcontact.dart';

class AppbarPresenter {
  AppbarViewContact? _appbarViewContact;

  AppbarPresenter(this._appbarViewContact);

  Future<void> getCategoryList() async {
    try {
      var response = await ApiClient.getListObject(ApiUrls().API_CATEGORY_LIST);
      if (response.status_code == 200) {
        List<dynamic> source = response.data!;
        _appbarViewContact!
            .getCategoryListSuccess(CategoryModel.getListCategory(source));
      } else {
        _appbarViewContact!.getCategoryListError(null);
      }
    } catch (e) {
      _appbarViewContact!.getCategoryListError(e);
    }
  }
}
