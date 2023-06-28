class SliderModel {
  int sliderId;
  String sliderName;
  String sliderImage;
  String sliderStatus;
  String sliderDesc;
  String createdAt;
  String updatedAt;

  SliderModel({
    required this.sliderId,
    required this.sliderName,
    required this.sliderImage,
    required this.sliderStatus,
    required this.sliderDesc,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      sliderId: json['slider_id'],
      sliderName: json['slider_name'],
      sliderImage: json['slider_image'],
      sliderStatus: json['slider_status'],
      sliderDesc: json['slider_desc'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
  static List<SliderModel> getList(List<dynamic> source) {
    List<SliderModel> listProduct =
        source.map((e) => SliderModel.fromJson(e)).toList();
    return listProduct;
  }
}
