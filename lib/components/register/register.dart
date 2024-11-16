import 'package:almohamady/components/Home_page/home.dart';
import 'package:almohamady/components/login/login_Screen.dart';
import 'package:almohamady/service/Cubit/App_Cubit/app_cubit.dart';
import 'package:almohamady/service/Cubit/App_Cubit/app_states.dart';
import 'package:almohamady/core/custom_widgets/custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, AppStates state) {},
      builder: (context, AppStates state) {
        AppCubit cubit = AppCubit.get(context);
        Size size = MediaQuery.of(context).size;
        return Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'REGISTER',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                  ),
                ),
                Custom_Text_Form_Field(
                  context: context,
                  controller: cubit.email,
                  lable: 'Email',
                  iconpref: Icons.email,
                  keyboard: TextInputType.emailAddress,
                ),
                custom_sized_box(Isvertical: true),
                Custom_Text_Form_Field(
                  context: context,
                  controller: cubit.password,
                  lable: 'Password',
                  iconpref: Icons.lock,
                  keyboard: TextInputType.visiblePassword,
                  iconsuff: cubit.is_visibile
                      ? Icons.visibility_off_outlined
                      : Icons.visibility,
                  obscure: cubit.is_visibile ? false : true,
                  on_suff_tap: cubit.visibiility,
                ),
                custom_sized_box(Isvertical: true),
                Custom_Text_Button1(
                    context: context,
                    size: size,
                    text: 'register',
                    onpressed: () => Custom_Nav_pushReplacement(
                        context: context, page: Home_Page())),
                custom_sized_box(Isvertical: true),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('If you have an account go to '),
                    InkwellText(
                        context: context,
                        text: 'login',
                        ThePage: const LoginScreen(),
                        ontap: () {
                          Navigator.pop(context);
                        })
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
