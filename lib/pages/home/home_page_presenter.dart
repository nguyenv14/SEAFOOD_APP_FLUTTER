import 'dart:convert';
import 'dart:ffi';

import 'package:seafoods/api/api_link_util.dart';
import 'package:seafoods/api/api_service.dart';
import 'package:seafoods/model/product.dart';
import 'package:seafoods/model/slider.dart';
import 'package:seafoods/pages/home/home_page_view_contact.dart';
import 'package:http/http.dart' as http;

class HomePagePresenter {
  HomePageViewContact? _homePageViewContact;
  HomePagePresenter(this._homePageViewContact);
  bool connect = true;
  Future<void> loadProductPopular() async {
    try {
      var resBody =
          await ApiClient.getListObject(ApiUrls().API_PRODUCT_LIST_TRENDING);
      if (resBody.status_code == 200) {
        List<dynamic> source = resBody.data!;
        _homePageViewContact!
            .loadProductPopularSuccess(Product.getList(source));
      } else {
        _homePageViewContact!.loadProductPopularError();
      }
    } catch (e) {
      print("PopularProduct" + e.toString());
      _homePageViewContact!.loadProductPopularError();
    }
  }

  Future<void> loadProductRecommend() async {
    try {
      var resBody =
          await ApiClient.getListObject(ApiUrls().API_PRODUCT_LIST_NEW);
      if (resBody.status_code == 200) {
        List<dynamic> source = resBody.data!;
        _homePageViewContact!
            .loadProductRecommendSuccess(Product.getList(source));
      } else {
        _homePageViewContact!.loadProductRecommentError();
      }
    } catch (e) {
      print("RecommendProduct" + e.toString());
      _homePageViewContact!.loadProductRecommentError();
    }
  }

  Future<void> loadSliderList() async {
    if (connect) {
      try {
        connect = false;
        var resBody = await ApiClient.getListObject(ApiUrls().API_SLIDER_LIST);
        if (resBody.status_code == 200) {
          List<dynamic> source = resBody.data!;
          _homePageViewContact!
              .loadSliderListSuccess(SliderModel.getList(source));
          connect = true;
        }
      } catch (e) {
        connect = true;
        print("slider" + e.toString());
      }
    }
  }
}
