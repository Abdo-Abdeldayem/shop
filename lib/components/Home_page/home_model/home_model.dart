class HomeModel {
  late bool status;
  late String? message;
  late Data_Home_model? data;
  HomeModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data_Home_model.fromjson(json['data']);
  }
}

class Data_Home_model {
  List<Banners> banners = [];
  List<Products> products = [];

  Data_Home_model.fromjson(Map<String, dynamic> json) {
    // if (json['banners'] != null) {
    //   for (var element in json['banners']) {
    //     banners.add(Banners.fromjson(element));
    //   }
    // }

    json['banners'].forEach((element) {
      banners.add(Banners.fromjson(element));
    });

    // if (json['products'] != null) {
    //   for (var element in json['products']) {
    //     products.add(Products.fromjson(
    //         element)); // Ensure you have a Products class similar to Banners
    //   }
    // }

    json['products'].forEach((element) {
      products.add(Products.fromjson(element));
    });
  }
}

class Banners {
  int? id;
  late String image;

  Banners.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class Products {
  int? id;
  var price;
  var old_price;
  var discount;
  late String image;
  late String name;
  late bool in_favorites;
  late bool in_cart;

  Products.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    in_favorites = json['in_favorites'];
    in_cart = json['in_cart'];
  }
}
