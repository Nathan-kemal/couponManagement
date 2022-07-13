import 'package:coupon_manegement/screen/MyButton.dart';
import 'package:coupon_manegement/screen/admin/Add_cc.dart';

import 'package:coupon_manegement/screen/admin/add_resdant.dart';
import 'package:coupon_manegement/screen/admin/customerlist.dart';
import 'package:coupon_manegement/screen/admin/removeCustomer.dart';
import 'package:coupon_manegement/screen/admin/removec.dart';
import 'package:coupon_manegement/screen/admin/removeresdant.dart';
import 'package:coupon_manegement/screen/auth/login_screen.dart';
import 'package:coupon_manegement/screen/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminScreen extends StatefulWidget {
  AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Get.snackbar('title', 'message');
  }

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
          title: Text('Admin'),
        ),
        body: Center(
          child: IntrinsicWidth(
            stepWidth: 200,
            child: SingleChildScrollView(
              child: Wrap(
                // mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                alignment: WrapAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => AddResdant(), arguments: 'Add Resdant');
                      },
                      child: MyButton(
                        title: 'Add Resident',
                        imagePath: 'images/add-user.png',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => RemoveResdant(), arguments: 'Resident');
                      },
                      child: MyButton(
                          title: 'Remove Resident',
                          imagePath: 'images/delete-user.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => CustomerList(), arguments: 'Customer');
                      },
                      child: MyButton(
                        title: 'Customer List',
                        imagePath: 'images/man.png',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => RemoveCoustoomer(), arguments: 'Customer');
                      },
                      child: MyButton(
                        title: 'Remove Customer',
                        imagePath: 'images/delete-user.png',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => AddCC(), arguments: 'Customer');
                      },
                      child: MyButton(
                        title: 'Add CCS',
                        imagePath: 'images/store.png',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => RemoveResdant(), arguments: 'CCS');
                      },
                      child: MyButton(
                        title: 'Remove CCS',
                        imagePath: 'images/remove.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
