import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// defult textButton
Widget Custom_Text_Button1({
  required Size size,
  required Function() onpressed,
  required String? text,
  double? height,
  double? width,
  Color? color,
  double? fontsize,
  required BuildContext context,
}) =>
    Container(
      height: height ?? size.height * 0.05,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: TextButton(
        onPressed: onpressed,
        child: Text(
          text!,
          style: Theme.of(context).textTheme.bodyLarge,
          // TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
      ),
    );
// InkWell(
//   borderRadius: const BorderRadius.all(
//     Radius.circular(20.0),
//   ),
//   onTap: () {
//     onpressed();
//   },
//   child: Center(
//     child: Text(
//       text!,
//       style: TextStyle(
//         fontWeight: FontWeight.bold,
//         fontSize: 18.0,
//         color: Colors.deepPurple,
//       ),
//     ),
//   ),
// ));

// textInkwell
Widget InkwellText({
  required BuildContext context,
  String? text,
  Widget? ThePage,
  double pading = 0.0,
  required void Function() ontap,
}) =>
    Padding(
      padding: EdgeInsets.all(pading),
      child: InkWell(
          child: Text(
            text!,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
            //  Theme.of(context).textTheme.bodySmall,
          ),
          onTap: () {
            ontap();
          }),
    );

// defult navigarotPush
void Custom_Nav_push({
  required BuildContext context,
  required Widget page,
}) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );

// defult navigarotPushReplacment
void Custom_Nav_pushReplacement({
  required BuildContext context,
  required Widget page,
}) =>
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );

// defult textFormField
Widget Custom_Text_Form_Field({
  required TextEditingController? controller,
  void Function(String)? Onchanged,
  void Function(String)? Onsubmite,
  bool obscure = false,
  TextInputType? keyboard,
  String? lable,
  IconData? iconpref,
  IconData? iconsuff,
  void Function()? on_suff_tap,
  required BuildContext context,
}) =>
    Container(
      margin: EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 1.5,
            ),
          ),
          labelText: lable,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          prefixIcon: Icon(iconpref),
          suffixIcon: GestureDetector(
            onTap: on_suff_tap,
            child: Icon(iconsuff),
          ),
        ),
        keyboardType: keyboard,
        obscureText: obscure,
        onChanged: Onchanged,
        onFieldSubmitted: Onsubmite,
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field musn\'t be empty';
          }
          return null;
        },
      ),
    );
// sizedBox
Widget custom_sized_box({required bool Isvertical}) => SizedBox(
      height: Isvertical ? 10.0 : 0.0,
      width: Isvertical ? 0.0 : 10.0,
    );

// my driver
Widget MyDriver() => Container(
      height: 1.0,
      width: 1.0,
      color: Colors.grey,
    );

// my toast
void My_Toast({@required text, @required state}) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: choosecolor(state),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

enum choosetoast { SUCESS, ERROR }

Color choosecolor(choosetoast state) {
  Color color;
  switch (state) {
    case choosetoast.SUCESS:
      color = Colors.green;
      break;
    case choosetoast.ERROR:
      color = Colors.red;
      break;
  }

  return color;
}
