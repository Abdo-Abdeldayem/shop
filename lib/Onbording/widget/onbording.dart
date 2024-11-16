import 'package:almohamady/components/login/login_Screen.dart';
import 'package:almohamady/Onbording/model/model_page.dart';
import 'package:almohamady/Onbording/logic/onboard_cubit.dart';
import 'package:almohamady/Onbording/logic/onboard_states.dart';
import 'package:almohamady/core/custom_widgets/custom.dart';
import 'package:almohamady/service/network/local/Sheredpreferance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnbordingCubit(),
      child: BlocConsumer<OnbordingCubit, OnbordingStates>(
        listener: (BuildContext context, OnbordingStates state) {},
        builder: (BuildContext context, OnbordingStates state) {
          Future<bool?> submit() async {
            await Cach_helper.saveData(key: 'Onbording', value: true)
                .then((value) {
              {
                Custom_Nav_pushReplacement(
                  // ignore: use_build_context_synchronously
                  context: context,
                  page: const LoginScreen(),
                );
              }
            });
            return null;
          }

          Size size = MediaQuery.of(context).size;
          OnbordingCubit cubit = OnbordingCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.blue[100],
            appBar: AppBar(
              backgroundColor: Colors.blue[100],
              actions: [
                InkwellText(
                    text: 'Skip',
                    ontap: () => submit(),
                    pading: 8.0,
                    context: context),

                // Custom_Text_Button1(
                //     size: size,
                //     text: 'Skip',
                //     onpressed: () {
                //       submit();
                //     })
              ],
              elevation: 0,
            ),
            body: Stack(
              alignment: Alignment(0, 0.75),
              children: [
                SizedBox(
                  height: double.infinity,
                  child: PageView(
                    onPageChanged: (index) {
                      if (index == 0) {
                        cubit.change_first();
                      } else if (index == 1) {
                        cubit.for_second();
                      } else if (index == 2) {
                        cubit.change_last();
                      }
                    },
                    controller: cubit.controller,
                    children: [
                      PageModel(
                        page: 'assets/image_1.webp',
                        title: 'Welcom to our Mall',
                      ),
                      PageModel(
                        page: 'assets/image_2.jpg',
                        title: 'Come on and buy taht you want',
                      ),
                      PageModel(
                        page: 'assets/image_3.jpg',
                        title: 'You should take a look at our products',
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    state is InitialState || cubit.is_first
                        ? SizedBox(width: size.width * 0.09)
                        : InkwellText(
                            context: context,
                            text: 'Back',
                            ontap: () {
                              cubit.controller.previousPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                          ),

                    //  Custom_Text_Button1(
                    //     size: size,
                    //     onpressed: () {
                    // cubit.controller.previousPage(
                    //     duration: const Duration(milliseconds: 500),
                    //     curve: Curves.easeIn);
                    //     },
                    //     text: 'Back'),
                    SmoothPageIndicator(controller: cubit.controller, count: 3),
                    cubit.is_last
                        ? InkwellText(
                            context: context,
                            text: 'Done',
                            ontap: () => submit(),
                          )

                        // Custom_Text_Button1(
                        //     size: size,
                        //     onpressed: () {
                        //       submit();
                        //     },
                        //     text: 'Done')
                        : InkwellText(
                            context: context,
                            text: 'Next',
                            ontap: () {
                              cubit.controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                          ),

                    // Custom_Text_Button1(
                    //     size: size,
                    //     onpressed: () {
                    // cubit.controller.nextPage(
                    //     duration: const Duration(milliseconds: 500),
                    //     curve: Curves.easeIn);
                    //     },
                    //     text: 'Next'),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
