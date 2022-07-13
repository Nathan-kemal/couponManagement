import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coupon_manegement/screen/admin_screen.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class AddCC extends StatefulWidget {
  const AddCC({Key? key}) : super(key: key);

  @override
  State<AddCC> createState() => _AddCCState();
}

class _AddCCState extends State<AddCC> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController CcName = TextEditingController();
  TextEditingController houseNumber = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  bool isLoading = false;
  String msg = '';

  bool isShown = true;

  String selectedValue = 'AA';
  List<String> list = [
    'AA',
    'BB',
    'CC',
  ];
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
          backgroundColor: Color(0xff212333),
          title: Text(
            'Add Resident',
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: CcName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Your Last Name';
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'CC Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                  value: selectedValue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: list
                      .map((String e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          )))
                      .toList(),
                  onChanged: (value) {
                    selectedValue = value as String;
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLength: 10,
                  controller: phoneNumber,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Your PhoneNumber';
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Phone  Number',
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
                  controller: confirmpassword,
                  obscureText: isShown,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'confrm password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Check Firebase
                      if (password.text == confirmpassword.text) {
                        Get.defaultDialog(
                          onConfirm: () {
                            var passencode = utf8.encode(password.text);
                            var hash = md5.convert(passencode).toString();
                            try {
                              final doc = FirebaseFirestore.instance
                                  .collection('all_cc_database')
                                  .doc(CcName.text)
                                  .set({
                                'cc name': CcName.text,
                                'cc group': selectedValue,
                                'phone number': phoneNumber.text,
                                'password': hash
                              }).then((value) => Get.offAll(
                                        () => AdminScreen(),
                                        arguments: 'Add User to database',
                                      ));
                            } catch (e) {}
                          },
                          onCancel: () {
                            Navigator.pop(context);
                            setState(() {
                              isLoading = false;
                            });
                          },
                          title: "Add CC",
                          backgroundColor: Color(0xff212333),
                          titleStyle: TextStyle(color: Colors.white),
                          middleTextStyle: TextStyle(color: Colors.white),
                          textConfirm: "Confirm",
                          textCancel: "Cancel",
                          cancelTextColor: Colors.white,
                          confirmTextColor: Colors.white,
                          buttonColor: Colors.red,
                          barrierDismissible: false,
                          content: Column(
                            children: [
                              Text(
                                'Are you sure You Want To Add CC',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        );
                        setState(() {
                          isLoading = true;
                        });
                      }
                    }
                  },
                  child: Text('Next'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
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
            ]),
          ),
        ),
      ),
    );
  }
}
