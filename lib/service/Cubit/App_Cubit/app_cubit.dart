import 'package:almohamady/core/constants/constant.dart';
import 'package:almohamady/components/login/user_model/login_model.dart';
import 'package:almohamady/service/Cubit/App_Cubit/app_states.dart';
import 'package:almohamady/service/network/remote/API/helper/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool is_visibile = false;
  late User_login_Model user_login;

  void visibiility() {
    is_visibile = !is_visibile;
    emit(change_Visibility());
  }

  Future userlogin() {
    emit(getLoding());
    return DioHelper.postData(
      url: urlLogin,
      query: {
        "email": email.text,
        'password': password.text,
      },
    ).then((value) {
      user_login = User_login_Model.fromJson(value.data);
      emit(Success_login(user_login));
      return value;
    }).catchError((error) {
      print(
          'errrrrrrrrrrrorrrrrrrrrrrrr issssssssssssssss ${error.toString()}');
      emit(Error_login(error));
      return Response(requestOptions: RequestOptions(path: urlLogin));
    });
  }

  void For_datalogin(context, form) {
    if (form.currentState!.validate()) {
      userlogin().then((value) {
        return value;
      }).catchError((error) {
        print('error isssssssssssssssssssssss ${error.toString()}');
        emit(Error_login(error));
        return Response(requestOptions: RequestOptions(path: urlLogin));
      });
    }
    FocusScope.of(context).unfocus();
  }
}
