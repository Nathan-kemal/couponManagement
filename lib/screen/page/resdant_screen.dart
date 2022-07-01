import 'package:coupon_manegement/screen/page/resdant/resdant_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResdantScreen extends StatefulWidget {
  const ResdantScreen({Key? key}) : super(key: key);

  @override
  State<ResdantScreen> createState() => _ResdantScreenState();
}

class _ResdantScreenState extends State<ResdantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.blue,
                child: InkWell(
                  onTap: () {
                    Get.to(() => ResdantOption());
                  },
                  child: Container(
                    height: 200,
                    child: Center(
                      child: Text(
                        'Flower Has Arrived $index',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
