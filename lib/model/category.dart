class CategoryModel {
  int categoryId;
  String categoryName;
  String categoryDesc;
  String categoryImage;
  int categoryStatus;

  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.categoryDesc,
    required this.categoryImage,
    required this.categoryStatus,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['category_id'],
      categoryName: json['category_name'],
      categoryDesc: json['category_desc'],
      categoryImage: json['category_image'],
      categoryStatus: json['category_status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'category_name': categoryName,
      'category_desc': categoryDesc,
      'category_image': categoryImage,
      'category_status': categoryStatus,
    };
  }

  static List<CategoryModel> getListCategory(List<dynamic> source) {
    List<CategoryModel> categoryList =
        source.map((e) => CategoryModel.fromJson(e)).toList();
    return categoryList;
  }
}
