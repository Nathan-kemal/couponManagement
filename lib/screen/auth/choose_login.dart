import 'package:coupon_manegement/screen/MyButton.dart';
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
        backgroundColor: Color(0xff212333),
        appBar: AppBar(
          backgroundColor: Color(0xff212333),
          title: Text(''),
        ),
        body: Center(
          child: IntrinsicWidth(
            stepWidth: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => Login(), arguments: 'AACA');
                    },
                    child: MyButton(
                        title: 'AACA', imagePath: 'images/building.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => Login(), arguments: 'CC');
                    },
                    child: MyButton(title: 'CC', imagePath: 'images/store.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => Login(), arguments: 'Customer');
                    },
                    child: MyButton(
                        title: 'Coustomer', imagePath: 'images/man.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
