class Model {
  int? status_code;
  String? message;
  List<Object>? data;

  Model.fromJson(Map<String, dynamic> json) {
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
