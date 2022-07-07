import 'package:coupon_manegement/screen/auth/choose_login.dart';
import 'package:coupon_manegement/screen/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff292D3F),
        image: DecorationImage(
          image: AssetImage("images/addisababa3.png"),
          fit: BoxFit.contain,
        ),
      ),
      child: Scaffold(
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        body: Center(
            child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    speed: Duration(milliseconds: 100),
                    textAlign: TextAlign.center,
                    'Coupon Management System For Addis Ababa City Adminstraion',
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontFamily: 'Odibee Sans',
                    ),
                  ),
                ],
              ),
              Text(''),
              // Text(
              //   textAlign: TextAlign.center,
              //   'Coupon Management System For Addis Ababa City Adminstraion',
              //   style: TextStyle(
              //     fontSize: 35,
              //     fontFamily: 'Odibee Sans',
              //   ),
              // ),
              SizedBox(
                height: 450,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 200,
                  height: 75,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        width: 5,
                        color: Colors.amber,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChooseLogin()));
                    },
                    child: Text(
                      'LogIn',
                      style: TextStyle(
                        fontFamily: 'Odibee Sans',
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 200,
                height: 75,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 5,
                      color: Colors.amber,
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => RegisterScreen());
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontFamily: 'Odibee Sans',
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
