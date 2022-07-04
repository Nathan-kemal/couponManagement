import 'package:coupon_manegement/screen/page/cc/ccAACA.dart';
import 'package:coupon_manegement/screen/page/cc/ccResdant.dart';
import 'package:coupon_manegement/screen/page/cc/remove_accound.dart';
import 'package:coupon_manegement/screen/page/feedback.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CCScreen extends StatefulWidget {
  const CCScreen({Key? key}) : super(key: key);

  @override
  State<CCScreen> createState() => _CCScreenState();
}

class _CCScreenState extends State<CCScreen> {
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('CC'),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => FeedbackScreen());
              },
              icon: Icon(Icons.email),
            ),
          ],
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Get.to(() => CCAACAScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      color: Colors.red,
                      child: Center(child: Text('AACA')),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Get.to(() => CCResdant());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      color: Colors.amber,
                      child: Center(child: Text('Coustomer')),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Get.to(() => RemoveAccount());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      color: Colors.red,
                      child: Center(child: Text('Remove Account')),
                    ),
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
