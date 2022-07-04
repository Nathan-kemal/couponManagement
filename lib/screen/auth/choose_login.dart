import 'package:coupon_manegement/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseLogin extends StatelessWidget {
  const ChooseLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/b3.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(''),
        ),
        body: Center(
          child: IntrinsicWidth(
            stepWidth: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 200,
                  height: 75,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => Login(), arguments: 'AACA');
                      },
                      child: Text('AACA')),
                ),
                SizedBox(height: 10),
                Container(
                  height: 75,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => Login(), arguments: 'CC');
                      },
                      child: Text('CC')),
                ),
                SizedBox(height: 10),
                Container(
                  height: 75,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => Login(), arguments: 'Customer');
                      },
                      child: Text('Coustomer')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
