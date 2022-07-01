import 'package:coupon_manegement/screen/page/aaca_screen.dart';
import 'package:coupon_manegement/screen/page/cc_screen.dart';
import 'package:coupon_manegement/screen/page/resdant_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  String user = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          ElevatedButton(onPressed: () {

            if(user!=''){
              if(user == 'AACA'){
                Get.to(() => AACAScreen());
                    // check firebase
              }else if(user == 'CC'){
                Get.to(() => CCScreen());
                    // check firebase
              }else if(user == 'Resdant'){
                Get.to(() => ResdantScreen());
                    // check firebase
              }
            }

          }, child: Text('Login'))
        ],
      ),
    );
  }
}
