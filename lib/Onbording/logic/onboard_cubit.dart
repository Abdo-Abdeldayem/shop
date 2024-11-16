import 'package:almohamady/Onbording/logic/onboard_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnbordingCubit extends Cubit<OnbordingStates> {
  OnbordingCubit() : super(InitialState());

  static OnbordingCubit get(context) => BlocProvider.of(context);

  bool is_first = false;
  bool is_last = false;
  PageController controller = PageController();

  void change_first() {
    is_first = true;
    emit(Change_first_State());
  }

  void for_second() {
    is_first = false;
    is_last = false;
    emit(For_second());
  }

  void change_last() {
    is_last = true;
    emit(Change_last_State());
  }
}
