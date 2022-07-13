import 'package:coupon_manegement/screen/admin_screen.dart';
import 'package:coupon_manegement/screen/auth/verification.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddResdant extends StatefulWidget {
  const AddResdant({Key? key}) : super(key: key);

  @override
  State<AddResdant> createState() => _AddResdantState();
}

class _AddResdantState extends State<AddResdant> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController houseNumber = TextEditingController();
  TextEditingController idNumber = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  bool isLoading = false;
  String msg = '';
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
                  controller: firstName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Your first Name';
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'First Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: lastName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Your Last Name';
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Last Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: houseNumber,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Your House Number';
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'House number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: idNumber,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Your id Number';
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'id  Number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
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
              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Check Firebase
                      Get.defaultDialog(
                          onConfirm: () {
                            try {
                              final doc = FirebaseFirestore.instance
                                  .collection('all_resdant_database')
                                  .doc(idNumber.text)
                                  .set({
                                'id number': idNumber.text,
                                'house number': houseNumber.text,
                                'first name': firstName.text,
                                'last name': lastName.text,
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
                          title: "Add Resdant",
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
                                'Are you sure You Want To Add Resdant',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ));
                      setState(() {
                        isLoading = true;
                      });
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
