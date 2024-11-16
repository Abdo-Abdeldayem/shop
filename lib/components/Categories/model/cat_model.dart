class CategotyModel {
  late bool status;
  late DataModel data;
  CategotyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = DataModel.fromJson(json['data']);
  }
}

class DataModel {
  int? current_page;
  List<MainDataModel> data = [];

  DataModel.fromJson(Map<String, dynamic> json) {
    current_page = json['current_page'];
    json['data'].forEach((element) {
      data.add(MainDataModel.fromJson(element));
    });
  }
}

class MainDataModel {
  int? id;
  String? name;
  String? image;

  MainDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
