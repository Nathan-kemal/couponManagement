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
            'Registration Form',
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
                      setState(() {
                        isLoading = true;
                      });
                      try {
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
                              Get.to(() => VerificationScreen(), arguments: {
                                'id number': idNumber.text,
                                'house number': houseNumber.text,
                                'first name': firstName.text,
                                'last name': lastName.text,
                              });
                            } else {
                              setState(() {
                                isLoading = false;
                                msg = 'User Not Found!';
                              });
                            }

                            counter++;
                          });
                        });
                      } catch (e) {}
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
