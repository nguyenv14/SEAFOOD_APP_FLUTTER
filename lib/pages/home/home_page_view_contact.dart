import 'package:seafoods/model/product.dart';
import 'package:seafoods/model/slider.dart';

abstract class HomePageViewContact {
  void loadProductRecommendSuccess(List<Product> list);
  void loadProductRecommentError();

  void loadProductPopularSuccess(List<Product> list);
  void loadProductPopularError();

  void loadSliderListSuccess(List<SliderModel> list);
}
