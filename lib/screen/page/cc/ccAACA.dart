import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CCAACAScreen extends StatefulWidget {
  const CCAACAScreen({Key? key}) : super(key: key);

  @override
  State<CCAACAScreen> createState() => _CCAACAScreenState();
}

class _CCAACAScreenState extends State<CCAACAScreen> {
  TextEditingController textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
          title: Text('CC'),
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
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FirebaseFirestore.instance.collection('Messages').add({
                          'sender': 'CC',
                          'feedback': '${textEditingController.text}'
                        });

                        textEditingController.clear();
                      }
                    },
                    child: Text('Send'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
