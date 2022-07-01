import 'package:coupon_manegement/screen/auth/verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController houseNumber = TextEditingController();
  TextEditingController idNumber = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/b3.jpg'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(''),
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
                      hintText: 'id  Number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phoneNumber,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Your PhoneNumber';
                    }
                  },
                  decoration: InputDecoration(
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

                      final doc = FirebaseFirestore.instance
                          .collection('all_resdant_database')
                          .get()
                          .then((value) {
                        value.docs.forEach((element) {
                          int counter = 0;
                          int length = value.docs.length;
                          final fn = element.get('first name');
                          final ln = element.get('last name');
                          final idn = element.get('id number');
                          final housen = element.get('house number');

                          if (fn == firstName.text &&
                              ln == lastName.text &&
                              idn == idNumber.text &&
                              housen == houseNumber.text) {
                            // Get.to(() => VerificationScreen(),
                            //     arguments: 'FOUND');
                            print('found');
                          } else {}

                          counter++;
                        });
                      });
                    }
                  },
                  child: Text('Next'),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
