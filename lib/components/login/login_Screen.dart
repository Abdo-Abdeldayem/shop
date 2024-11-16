import 'package:almohamady/components/Home_page/home.dart';
import 'package:almohamady/service/Cubit/App_Cubit/app_cubit.dart';
import 'package:almohamady/service/Cubit/App_Cubit/app_states.dart';
import 'package:almohamady/components/register/register.dart';
import 'package:almohamady/core/custom_widgets/custom.dart';
import 'package:almohamady/service/network/local/Sheredpreferance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> form = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, AppStates state) {
          if (state is Success_login) {
            if (state.user_login.status) {
              Cach_helper.saveData(
                      key: 'token', value: state.user_login.data?.token)
                  .then((value) {
                My_Toast(
                  text: state.user_login.message,
                  state: choosetoast.SUCESS,
                );
                AppCubit.get(context).email.clear();
                AppCubit.get(context).password.clear();
                Custom_Nav_pushReplacement(context: context, page: Home_Page());
              });
            } else {
              My_Toast(
                  text: state.user_login.message, state: choosetoast.ERROR);
            }
          }
        },
        builder: (context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          Size size = MediaQuery.of(context).size;
          return Scaffold(
            body: SafeArea(
              child: Form(
                key: form,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'LOGIN',

                      style: Theme.of(context).textTheme.headlineLarge,
                      // TextStyle(
                      //   fontWeight: FontWeight.bold,
                      //   fontSize: 35.0,
                      // ),
                    ),
                    custom_sized_box(Isvertical: true),
                    Custom_Text_Form_Field(
                        context: context,
                        controller: cubit.email,
                        lable: 'Email',
                        iconpref: Icons.email,
                        keyboard: TextInputType.emailAddress,
                        Onsubmite: (value) {
                          cubit.For_datalogin(context, form);
                        }),
                    // custom_sized_box(),
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
                        Onsubmite: (value) {
                          cubit.For_datalogin(context, form);
                        }),
                    custom_sized_box(Isvertical: true),
                    state is! getLoding
                        ? Custom_Text_Button1(
                            context: context,
                            size: size,
                            text: 'login',
                            onpressed: () {
                              cubit.For_datalogin(context, form);
                            })
                        : const Center(child: CircularProgressIndicator()),
                    custom_sized_box(Isvertical: true),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('If you don\'t have an account go to '),
                        InkwellText(
                          context: context,
                          text: 'register',
                          ontap: () {
                            Custom_Nav_pushReplacement(
                                context: context, page: RegisterScreen());
                          },
                          // ThePage: RegisterScreen(),
                          // nav: true
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
