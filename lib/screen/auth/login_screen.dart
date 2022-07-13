import 'package:coupon_manegement/screen/admin_screen.dart';
import 'package:coupon_manegement/screen/page/aaca_screen.dart';
import 'package:coupon_manegement/screen/page/cc_screen.dart';
import 'package:coupon_manegement/screen/page/resdant_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  String user = Get.arguments;

  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();
  String msg = '';
  bool isShown = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/b3.jpg'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Color(0xff212333),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '$user',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff212333),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'username should not be empty';
                    }
                  },
                  controller: username,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'password should not be empty';
                    }
                  },
                  controller: password,
                  obscureText: isShown,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isShown = !isShown;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (user != '') {
                        setState(() {
                          isLoading = true;
                        });
                        if (user == 'AACA') {
                          var hash = md5
                              .convert(utf8.encode(password.text))
                              .toString();

                          try {
                            FirebaseFirestore.instance
                                .collection('Accounts')
                                .doc('AACA')
                                .collection('Registered')
                                .where('name', isEqualTo: username.text)
                                .where('password', isEqualTo: password.text)
                                .get()
                                .then((value) {
                              if (value.docs.length > 0) {
                                Get.to(() => AACAScreen());
                              } else {
                                setState(() {
                                  isLoading = false;
                                  msg = 'Account not found!';
                                });
                              }
                            });
                          } catch (e) {}
                          // check firebase
                        } else if (user == 'CC') {
                          var hash = md5
                              .convert(utf8.encode(password.text))
                              .toString();

                          try {
                            FirebaseFirestore.instance
                                .collection('all_cc_database')
                                .where('cc name', isEqualTo: username.text)
                                .where('password', isEqualTo: hash)
                                .get()
                                .then((value) {
                              if (value.docs.length > 0) {
                                Get.to(() => CCScreen(),
                                    arguments: value.docs[0].get('cc name'));
                              } else {
                                setState(() {
                                  isLoading = false;
                                  msg = 'Account not found!';
                                });
                              }
                            });
                          } catch (e) {}

                          // check firebase
                        } else if (user == 'ADMIN') {
                          var hash = md5
                              .convert(utf8.encode(password.text))
                              .toString();

                          try {
                            FirebaseFirestore.instance
                                .collection('Accounts')
                                .doc('Admin')
                                .collection('Registered')
                                .where('username', isEqualTo: username.text)
                                .where('password', isEqualTo: hash)
                                .get()
                                .then((value) {
                              if (value.docs.length > 0) {
                                Get.off(() => AdminScreen());
                              } else {
                                setState(() {
                                  isLoading = false;
                                  msg = 'Account not found!';
                                });
                              }
                            });
                          } catch (e) {}
                        } else if (user == 'Customer') {
                          var hash = md5
                              .convert(utf8.encode(password.text))
                              .toString();
                          try {
                            FirebaseFirestore.instance
                                .collection('Accounts')
                                .doc('Coustomer')
                                .collection('Registered')
                                .where('username', isEqualTo: username.text)
                                .where('password', isEqualTo: hash)
                                .get()
                                .then((value) {
                              if (value.docs.length > 0) {
                                print('pull up ${value.docs[0].data()}');
                                Get.to(() => ResdantScreen(), arguments: {
                                  'fn': '${value.docs[0].get('first name')}',
                                  'ln': '${value.docs[0].get('last name')}',
                                  'id': '${value.docs[0].get('id number')}'
                                });
                              } else {
                                setState(() {
                                  isLoading = false;
                                  msg = 'Account not found!';
                                });
                              }
                            });
                          } on FirebaseException catch (e) {
                            Get.snackbar(
                              'Login',
                              'Account not found!',
                              colorText: Colors.red,
                            );
                          }

                          //  Get.to(() => ResdantScreen());
                          // check firebase
                        }
                      }
                    }
                  },
                  child: Text('Login')),
              Text(
                '$msg',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                  fontFamily: 'Odibee Sans',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              isLoading ? CircularProgressIndicator() : Container()
            ],
          ),
        ),
      ),
    );
  }
}
