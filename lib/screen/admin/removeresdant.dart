import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class RemoveResdant extends StatefulWidget {
  const RemoveResdant({Key? key}) : super(key: key);

  @override
  State<RemoveResdant> createState() => _RemoveResdantState();
}

class _RemoveResdantState extends State<RemoveResdant> {
  String? fname;
  String? lname;
  String? idnumber;
  String? housenumber;

  TextEditingController idT = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var doc;
  Map<String, dynamic>? check;
  bool isLoading = false;
  String msg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212333),
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color(0xff212333),
      ),
      body: Form(
        key: _formKey,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Id';
                }
              },
              controller: idT,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'account id',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  isLoading = true;
                });
                try {
                  doc = await FirebaseFirestore.instance
                      .collection('all_resdant_database')
                      .where('id number', isEqualTo: idT.text.trim())
                      .get()
                      .then((value) {
                    if (value.docs.isNotEmpty) {
                      check = value.docs[0].data();
                      setState(() {
                        isLoading = false;
                      });
                    } else {
                      check = null;
                      setState(() {
                        isLoading = false;
                        msg = 'Account Not Found';
                      });
                    }
                  });
                } on FirebaseException catch (e) {}
              }
            },
            child: Text('Search'),
          ),
          check != null
              ? Expanded(
                  child: ListView(children: <Widget>[
                    Center(
                        child: Text(
                      'Result',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),
                    DataTable(
                      columns: [
                        DataColumn(
                            label: Text('ID',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Name',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('House no',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text(
                            check?['id number'],
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                          DataCell(Text(
                            '${check?['first name']} ${check?['last name']}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          )),
                          DataCell(Text(
                            check?['house number'],
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          )),
                        ]),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          FirebaseFirestore.instance
                              .collection('all_resdant_database')
                              .doc('${check?['id number']}')
                              .delete()
                              .whenComplete(() {
                            setState(() {
                              isLoading = false;
                              check = null;
                            });
                          });
                        } on FirebaseException catch (e) {}
                      },
                      child: const Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    )
                  ]),
                )
              : Container(
                  child: Text(
                    '$msg',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
          SizedBox(
            height: 30,
          ),
          isLoading ? CircularProgressIndicator() : Container()
        ]),
      ),
    );
  }
}
