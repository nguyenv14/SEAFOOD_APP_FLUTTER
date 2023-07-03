class Models {
  int? status_code;
  String? message;
  List<dynamic>? data;

  Models.fromJson(Map<String, dynamic> json) {
    status_code = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Object>[];
      json['data'].forEach((item) {
        data!.add(item);
      });
    }
  }
}

class Model {
  int? status_code;
  String? message;
  dynamic data; // Khai báo data là dynamic

  Model.fromJson(Map<String, dynamic> json) {
    status_code = json['status_code'];
    message = json['message'];
    data = json['data']; // Gán trực tiếp giá trị từ json['data']
  }
}
