import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PageModel extends StatelessWidget {
  String page;
  String title;

  PageModel({super.key, required this.page, required this.title});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.2,
          ),
          Container(
            margin: EdgeInsetsDirectional.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: Image.asset(page),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.all(20.0),
            child: Text(
              textAlign: TextAlign.center,
              title,
              style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
