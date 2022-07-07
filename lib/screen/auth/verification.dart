import 'package:coupon_manegement/screen/page/resdant_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conpassword = TextEditingController();

  Map<String, dynamic> args = Get.arguments;
  String msg = '';
  bool isShown = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 35, 51, 1),
      body: SafeArea(
        child: Form(
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
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                      hintText: 'username',
                      fillColor: Colors.white,
                      filled: true,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'password should not be empty';
                    }
                  },
                  controller: conpassword,
                  obscureText: isShown,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'confrm password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Text(
                '$msg',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                  fontFamily: 'Odibee Sans',
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });

                      try {
                        if (password.text == conpassword.text) {
                          String rowpass = password.text;
                          var passencode = utf8.encode(rowpass);
                          var hash = md5.convert(passencode).toString();
                          FirebaseFirestore.instance
                              .collection('Accounts')
                              .doc('Coustomer')
                              .collection('Registered')
                              .doc(' ${args['id number']}')
                              .set({
                            'username': username.text,
                            'password': hash,
                            'house number': '${args['house number']}',
                            'id number': args['id number'],
                            'first name': args['first name'],
                            'last name': args['last name'],
                          }).then((value) => Get.offAll(() => ResdantScreen()));
                        } else {
                          setState(() {
                            isLoading = false;
                            msg = 'password dont much!';
                          });
                        }
                      } catch (e) {}
                    }
                  },
                  child: Text('Register')),
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
