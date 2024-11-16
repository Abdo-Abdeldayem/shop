class Favouritechangemodel {
  late bool status;
  late String message;

  Favouritechangemodel.fromJson(Map<String, dynamic> Json) {
    status = Json['status'];
    message = Json['message'];
  }
}
