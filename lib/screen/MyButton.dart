import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButton extends StatelessWidget {
  String title;
  String imagePath;
  String? route;
  MyButton({
    Key? key,
    required this.title,
    required this.imagePath,
    this.route = '/viewform',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff292D3F),
        borderRadius: BorderRadius.circular(20.0),
      ),
      width: 130,
      height: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            child: Image.asset(
              imagePath,
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
