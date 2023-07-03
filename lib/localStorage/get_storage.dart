import 'package:get_storage/get_storage.dart';
import 'package:seafoods/model/category.dart';

void main() async {
  await GetStorage.init(); // Khởi tạo GetStorage

  final box = GetStorage(); // Tạo một instance của GetStorage

  // Lưu trữ danh sách các đối tượng Category
  final List<CategoryModel> categories = [
    CategoryModel(
      categoryId: 3,
      categoryName: "Mực",
      categoryDesc: "Mực Cute",
      categoryImage:
          "http://192.168.1.7/DoAnCNWeb/public/fontend/assets/img/category/4_5642c42a705a4c3ebe680fb8996b7fb4_grande92.jpg",
      categoryStatus: 1,
    ),
    CategoryModel(
      categoryId: 7,
      categoryName: "Sushi",
      categoryDesc: "Sushi & Sashimi",
      categoryImage:
          "http://192.168.1.7/DoAnCNWeb/public/fontend/assets/img/category/3fc619c8-4fa3-473d-a1c7-06fb0aa81c35_8522f072873b42858331eab1db271857_grande70.jpeg",
      categoryStatus: 1,
    ),
    // Thêm các đối tượng Category khác vào danh sách
  ];

  box.write('categories', categories); // Lưu trữ danh sách categories

  // Truy xuất danh sách categories từ GetStorage
  final storedCategories = box.read<List<CategoryModel>>('categories23');
  print(storedCategories.runtimeType);
  if (storedCategories != null) {
    // In ra danh sách categories đã lưu trữ
    for (var category in storedCategories) {
      print(category.categoryName);
    }
  } else {
    print('Không tìm thấy danh sách categories');
  }

  // final storedCategories = box.read<List<CategoryModel>>('categories23');

  // if (categoryList != null) {
  //   final categoryToUpdate = categoryList.firstWhere(
  //     (category) => category.categoryId == 1,
  //     orElse: () => null!,
  //   );
  //   categoryList.remove(categoryToUpdate);
  //   if (categoryToUpdate != null) {
  //     categoryToUpdate.categoryStatus = 10;
  //     box.write('categoryList', categoryList);
  //   }
  // }
}

// void main() async {
//   await GetStorage.init(); // Khởi tạo GetStorage

//   final box = GetStorage(); // Tạo một instance của GetStorage

//   // Lấy danh sách categories từ GetStorage
// }
