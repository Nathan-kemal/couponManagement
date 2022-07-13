import 'package:coupon_manegement/screen/page/cc/ccAACA.dart';
import 'package:coupon_manegement/screen/page/feedback/AACACC.dart';
import 'package:coupon_manegement/screen/page/feedback/CoustomerFeedBack.dart';
import 'package:coupon_manegement/screen/page/feedback/cc_aacafeedback.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  Map arg = Get.arguments;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      // AACACCScreen(
      //   type: arg['type'],
      //   name: arg['name'],
      // ),
      CCAACAFeedback(name: arg['name']),
      CoustomerFeedback(name: arg['name']),
    ];
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/b3.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: arg['type'] == 'AACA'
          ? Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xff212333),
                title: Text('AACA Feedback'),
              ),
              body: Container(),
            )
          : Scaffold(
              backgroundColor: Color(0xff212333),
              appBar: AppBar(
                backgroundColor: Color(0xff212333),
                title: Text('CC Feedback'),
              ),
              bottomNavigationBar: NavigationBar(
                animationDuration: const Duration(seconds: 1),
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
                height: 60,
                // backgroundColor: Color(0xff292D3F),
                selectedIndex: index,
                onDestinationSelected: (int newIndex) {
                  setState(() {
                    index = newIndex;
                  });
                },
                destinations: [
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.home,
                      size: 25,
                      color: Colors.black,
                    ),
                    icon: Icon(
                      Icons.home_outlined,
                      color: Colors.black,
                    ),
                    label: 'AACA',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.person,
                      size: 25,
                      color: Colors.black,
                    ),
                    icon: Icon(
                      Icons.person_outlined,
                      color: Colors.black,
                    ),
                    label: 'Coustomer',
                  ),
                ],
              ),
              body: pages[index]),
    );
  }
}
