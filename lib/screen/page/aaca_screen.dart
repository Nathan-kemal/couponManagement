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

  var seleectedCC;
  final GlobalKey<FormState> _formKeyValue = GlobalKey<FormState>();

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
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("all_cc_database")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        const Text("Loading.....");
                      else {
                        List<DropdownMenuItem> cclist = [];
                        for (int i = 0; i < snapshot.data!.docs.length; i++) {
                          DocumentSnapshot snap = snapshot.data!.docs[i];
                          cclist.add(
                            DropdownMenuItem<String>(
                              child: Text(
                                '${snap['cc name']}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              value: "${snap['cc name']}",
                            ),
                          );
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(width: 50.0),
                            DropdownButton<dynamic>(
                              dropdownColor: Color(0xff212333),
                              items: cclist,
                              onChanged: (ccValue) {
                                setState(() {
                                  seleectedCC = ccValue;
                                });
                              },
                              value: seleectedCC,
                              isExpanded: false,
                              hint: new Text(
                                "Choose CC Type",
                                style: TextStyle(color: Color(0xff11b719)),
                              ),
                            ),
                          ],
                        );
                      }

                      return Container();
                    }),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FirebaseFirestore.instance
                            .collection('all_cc_database')
                            .doc(seleectedCC)
                            .collection('feedbacks')
                            .doc('AACA')
                            .collection('feedback')
                            .add({
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
