import 'package:coupon_manegement/screen/page/feedback.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AACAScreen extends StatefulWidget {
  const AACAScreen({Key? key}) : super(key: key);

  @override
  State<AACAScreen> createState() => _AACAScreenState();
}

class _AACAScreenState extends State<AACAScreen> {
  TextEditingController textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String selectedValue = 'AA';
  List<String> list = [
    'AA',
    'BB',
    'CC',
    'DD',
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
          title: Text('AACA'),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => FeedbackScreen(), arguments: 'AACA');
              },
              icon: Icon(Icons.email),
            ),
          ],
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Feedback should not empty';
                      }
                    },
                    controller: textEditingController,
                    maxLines: 5,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Feedback',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
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
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FirebaseFirestore.instance.collection('Messages').add({
                          'sender': 'AACA',
                          'feedback': '${textEditingController.text}'
                        });

                        textEditingController.clear();
                      }
                    },
                    child: Text('Send'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
