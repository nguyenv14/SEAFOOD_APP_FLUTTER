import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/dismesions.dart';
import 'package:seafoods/Constant/style_text.dart';
import 'package:seafoods/model/category.dart';
import 'package:seafoods/model/product.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:seafoods/pages/container/app_bar_widget.dart';
import 'package:seafoods/pages/search/search_presenter.dart';
import 'package:seafoods/pages/search/search_viewcontact.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> implements SearchViewContact {
  final _textController = new TextEditingController();
  final _textCategoryController = new TextEditingController();
  final _textFilterController = new TextEditingController();
  List<String> categoryString = [];
  bool isCategoryList = true;
  bool isProductList = false;
  bool isListening = false;
  RangeValues _currentRange = RangeValues(0, 100);
  double startValue = 0;
  double endValue = 100;
  double priceMin = 0;
  double priceMax = 100;
  List<Product>? productList;
  stt.SpeechToText? _speechToText;
  late SearchPresenter _searchPresenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speechToText = stt.SpeechToText();
    _searchPresenter = SearchPresenter(this);
    _searchPresenter.getCategoryList();
    _searchPresenter.getPriceMinAndMax();
    // _textController.
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
        implementBack: false,
        implementCart: true,
        implementOrder: false,
        scaffoldKey: _scaffoldKey,
        child: Container(
          child: Column(children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: AppColor.mainColor, width: 0.9)),
              child: TextField(
                controller: _textController,
                autofocus: false,
                onChanged: (value) {
                  _searchPresenter.getFilterProduct(
                      value,
                      _textCategoryController.text == "Tất cả"
                          ? ""
                          : _textCategoryController.text,
                      convertFilterToInt(_textFilterController.text),
                      (startValue * 1000).toInt(),
                      (endValue * 1000).toInt());
                },
                style: TextStyle(color: Colors.black, fontSize: 16),
                decoration: InputDecoration(
                    hintText: "Enter the key search",
                    focusColor: null,
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: AppColor.iconColor1,
                    suffixIcon: GestureDetector(
                      onTapDown: (details) async {
                        if (!isListening) {
                          print("hihi");
                          var available = await _speechToText!.initialize();
                          if (available) {
                            setState(() {
                              isListening = true;
                              _speechToText!.listen(
                                onResult: (result) {
                                  print(result.recognizedWords);
                                  _textController.text = result.recognizedWords;
                                  _searchPresenter.getFilterProduct(
                                      result.recognizedWords,
                                      _textCategoryController.text == "Tất cả"
                                          ? ""
                                          : _textCategoryController.text,
                                      convertFilterToInt(
                                          _textFilterController.text),
                                      (startValue * 1000).toInt(),
                                      (endValue * 1000).toInt());
                                },
                              );
                            });
                          }
                        }
                      },
                      onTapUp: (details) {
                        setState(() {
                          print("huhi");
                          isListening = false;
                        });
                        _speechToText!.stop();
                      },
                      child: Container(
                          width: 20,
                          height: 20,
                          margin:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          decoration: BoxDecoration(
                              color: AppColor.mainColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.mic_outlined,
                            color: const Color.fromARGB(255, 10, 6, 6),
                          )),
                    ),
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                    fillColor: null),
                cursorColor: AppColor.mainColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                isCategoryList
                    ? Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: 170,
                        child: CustomDropdown(
                            onChanged: (p0) {
                              _searchPresenter.getFilterProduct(
                                  _textController.text,
                                  p0 == "Tất cả" ? "" : p0,
                                  convertFilterToInt(
                                      _textFilterController.text),
                                  (startValue * 1000).toInt(),
                                  (endValue * 1000).toInt());
                            },
                            hintText: "Category",
                            items: ["Tất cả", ...categoryString],
                            controller: _textCategoryController),
                      )
                    : null!,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: 170,
                  child: CustomDropdown(
                      onChanged: (value) {
                        _searchPresenter.getFilterProduct(
                            _textController.text,
                            _textCategoryController.text == "Tất cả"
                                ? ""
                                : _textCategoryController.text,
                            convertFilterToInt(value),
                            (startValue * 1000).toInt(),
                            (endValue * 1000).toInt());
                      },
                      hintText: "Filter",
                      items: ["Reset", "A-Z", "Z-A", "Giá tăng", "Giá giảm"],
                      controller: _textFilterController),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                    alignment: Alignment.center,
                    width: 60,
                    child: Text(Dimesions.formatNumber(startValue) + "kđ")),
                Expanded(
                  child: RangeSlider(
                      min: priceMin,
                      max: priceMax,
                      inactiveColor: AppColor.signColor,
                      activeColor: AppColor.mainColor,
                      divisions: 100,
                      values: _currentRange,
                      onChangeEnd: (value) {
                        _searchPresenter.getFilterProduct(
                            _textController.text,
                            _textCategoryController.text == "Tất cả"
                                ? ""
                                : _textCategoryController.text,
                            convertFilterToInt(_textFilterController.text),
                            (startValue * 1000).toInt(),
                            (endValue * 1000).toInt());
                      },
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRange = values;
                          startValue = values.start;
                          endValue = values.end;
                        });
                      }),
                ),
                Container(
                    alignment: Alignment.center,
                    width: 60,
                    child: Text(Dimesions.formatNumber(endValue) + "kđ")),
              ],
            ),
            isProductList
                ? Expanded(
                    child: GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 240,
                        ),
                        itemCount: productList!.length,
                        itemBuilder: (context, index) {
                          return itemProductBuild(productList![index]);
                        }),
                  )
                : Lottie.asset("assets/raw/search.json")
          ]),
        ));
  }

  Widget itemProductBuild(Product product) {
    return Container(
        height: 240,
        width: double.maxFinite,
        // color: Colors.redAccent,
        child: Column(
          children: [
            Stack(children: [
              Container(
                // width: 100,
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                        image: NetworkImage(product.productImage!),
                        fit: BoxFit.cover)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // alignment: Alignment.topRight,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: AppColor.mainColor,
                    ),
                    // margin: EdgeInsets.only(left: 5, top: 5),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    // alignment: Alignment.topRight,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    // margin: EdgeInsets.only(left: 5, top: 5),
                    child: Text(
                      Dimesions.formatNumber(product.productPrice!.toDouble()) +
                          "đ",
                      style: AppText.text
                          .copyWith(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ],
              )
            ]),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: AppColor.mainColor.withOpacity(0.8),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Column(children: [
                SizedBox(
                  height: 6,
                ),
                Container(
                  width: 100,
                  child: Text(
                    product.productName!,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Text(
                  product.categoryName!,
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
                SizedBox(
                  height: 6,
                )
              ]),
            )
          ],
        ));
  }

  @override
  void getCategoryError(Object? object) {
    setState(() {
      isCategoryList = false;
      print(object);
    });
  }

  @override
  void getCategorySuccess(List<CategoryModel> categoryList) {
    setState(() {
      for (CategoryModel categoryModel in categoryList) {
        categoryString.add(categoryModel.categoryName);
      }
      isCategoryList = true;
    });
  }

  @override
  void getPriceMinAndMaxError(Object? object) {
    // TODO: implement getPriceMinAndMaxError
    setState(() {
      // startValue = 0;
      startValue = 0;
      endValue = 100;
      _currentRange = RangeValues(startValue, endValue);
    });
  }

  @override
  void getPriceMinAndMaxSuccess(List<Product> productList) {
    // TODO: implement getPriceMinAndMaxSuccess
    setState(() {
      priceMin = productList[0].productPrice!.toDouble() / 1000;
      priceMax = productList[1].productPrice!.toDouble() / 1000;
      startValue = priceMin;
      endValue = priceMax;
      _currentRange = RangeValues(priceMin, priceMax);
    });
  }

  int convertFilterToInt(String string) {
    if (string == "A-Z") {
      return 3;
    } else if (string == "Z-A") {
      return 4;
    } else if (string == "Giá tăng") {
      return 2;
    } else if (string == "Giá giảm") {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  void getProductSearchError(Object? object) {
    setState(() {
      this.productList = [];
      isProductList = false;
    });
    print(object);
  }

  @override
  void getProductSearchSuccess(List<Product> productList) {
    setState(() {
      this.productList = productList;
      isProductList = true;
    });
  }

  void _listen() async {
    if (!isListening) {
      var available = await _speechToText!.initialize();
      if (available) {
        setState(() {
          isListening = true;
        });
        _speechToText!.listen(
          onResult: (result) {
            setState(() {
              print(result.recognizedWords);
            });
            if (result.hasConfidenceRating && result.confidence > 0) {}
          },
        );
      }
    } else {}
  }
}
