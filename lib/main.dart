import 'package:almohamady/components/Home_page/home.dart';
import 'package:almohamady/components/login/login_Screen.dart';
import 'package:almohamady/Onbording/widget/onbording.dart';
import 'package:almohamady/core/Bloc_observer/Bloc_observer.dart';
import 'package:almohamady/core/constants/constant.dart';
import 'package:almohamady/service/Cubit/Shop_cubit/shop_cubit.dart';
import 'package:almohamady/service/network/local/Sheredpreferance.dart';
import 'package:almohamady/core/constants/themes/darkmode.dart';
import 'package:almohamady/core/constants/themes/lightmode.dart';
import 'package:almohamady/service/network/remote/API/helper/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await Cach_helper.initstate();
  bool? onbording = await Cach_helper.getData(key: 'Onbording');
  token = await Cach_helper.getData(key: 'token');
  // print('token : $token');
  Widget widget;
  if (onbording != null) {
    if (token != null)
      widget = Home_Page();
    else
      widget = LoginScreen();
  } else
    widget = Onbording();

  runApp(
    MultiBlocProvider(
        providers: [
          // BlocProvider(create: (context) => OnbordingCubit()),
          // BlocProvider(create: (context) => AppCubit()),
          BlocProvider(
              create: (context) => ShopCubit()
                ..getHomeData()
                ..getCatData()),
        ],
        child: MyApp(
          startwidget: widget,
        )),
  );
}

class MyApp extends StatelessWidget {
  final Widget? startwidget;
  MyApp({this.startwidget});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      routes: {
        'login': (context) => const LoginScreen(),
      },
      home: startwidget,
    );
  }
}
