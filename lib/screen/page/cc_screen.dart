import 'package:coupon_manegement/screen/MyButton.dart';
import 'package:coupon_manegement/screen/page/cc/ccAACA.dart';
import 'package:coupon_manegement/screen/page/cc/ccResdant.dart';
import 'package:coupon_manegement/screen/page/cc/remove_accound.dart';
import 'package:coupon_manegement/screen/page/coustomerlist.dart';
import 'package:coupon_manegement/screen/page/feedback.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CCScreen extends StatefulWidget {
  const CCScreen({Key? key}) : super(key: key);

  @override
  State<CCScreen> createState() => _CCScreenState();
}

class _CCScreenState extends State<CCScreen> {
  String getCCName = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/b3.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Color(0xff212333),
        appBar: AppBar(
          backgroundColor: Color(0xff212333),
          title: Text('CC'),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => FeedbackScreen(),
                    arguments: {'type': 'CC', 'name': getCCName});
              },
              icon: Icon(Icons.email),
            ),
          ],
        ),
        body: Center(
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => CCAACAScreen());
                    },
                    child:
                        MyButton(title: 'AACA', imagePath: 'images/store.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => CCResdant());
                    },
                    child: MyButton(
                        title: 'Coustomer', imagePath: 'images/man.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => RemoveAccount());
                    },
                    child: MyButton(
                        title: 'Remove Account',
                        imagePath: 'images/delete-user.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => CoutomerList());
                    },
                    child: MyButton(
                        title: 'Customer List',
                        imagePath: 'images/customer.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
