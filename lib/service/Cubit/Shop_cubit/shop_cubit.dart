import 'package:almohamady/components/Categories/categories.dart';
import 'package:almohamady/components/Categories/model/cat_model.dart';
import 'package:almohamady/components/Favourites/model/favouriteChangeModel.dart';
import 'package:almohamady/components/Home_page/home_model/home_model.dart';
import 'package:almohamady/components/Products/products.dart';
import 'package:almohamady/components/Favourites/favourites.dart';
import 'package:almohamady/core/constants/constant.dart';
import 'package:almohamady/service/Cubit/Shop_cubit/shop_state.dart';
import 'package:almohamady/service/network/remote/API/helper/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../components/Settings/settings.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(initialState());

  // ShopCubit(super.initialState);
  static ShopCubit get(context) => BlocProvider.of(context);

  List<Widget> screen = [
    Products_Screen(),
    Category_screen(),
    Favourites_Screen(),
    Settings_screen(),
  ];
  int current = 0;

  void change_current(index) {
    current = index;
    emit(changeCurrent_State());
  }

  Map<int, bool> Favourits = {};
  HomeModel? homeModel;
  void getHomeData() {
    emit(getLoding_State());
    DioHelper.getData(
      url: Home,
    ).then((value) {
      homeModel = HomeModel.fromjson(value.data);
      homeModel?.data?.products.forEach(
        (element) {
          Favourits.addAll({element.id!: element.in_favorites});
        },
      );
      // print(Favourits.toString());
      print('tttttttttttttt  : ${Favourits}');

      emit(homesuccess_State());
    }).catchError((error) {
      print(error.toString());
      emit(homeerror_State(error));
    });
  }

  CategotyModel? catModel;
  void getCatData() {
    emit(getLoding_State());
    DioHelper.getData(
      url: Cat,
    ).then((value) {
      catModel = CategotyModel.fromJson(value.data);
      // print(homeModel?.status);
      emit(catsuccess_State());
    }).catchError((error) {
      print(error.toString());
      emit(caterror_State(error));
    });
  }

  Favouritechangemodel? favouritechangemodel;
  void changeFavourite(int productId) {
    Favourits[productId] = !Favourits[productId]!;
    emit(Favsuccess_State());
    DioHelper.postData(
      url: Favourite,
      query: {'product_id': productId},
      token: token,
    ).then((value) {
      print('token : $token');
      favouritechangemodel = Favouritechangemodel.fromJson(value.data);
      print(value.data);
      emit(Favsuccess_State());
    }).catchError((error) {
      print('Favourite error is : ${error.toString()}');
      emit(Faverror_State(error));
    });
  }
}
