import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class RemoveAccount extends StatefulWidget {
  const RemoveAccount({Key? key}) : super(key: key);

  @override
  State<RemoveAccount> createState() => _RemoveAccountState();
}

class _RemoveAccountState extends State<RemoveAccount> {
  String? fname;
  String? lname;
  String? idnumber;
  String? housenumber;

  TextEditingController idT = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var doc;
  Map<String, dynamic>? check;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
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
                  hintText: 'account id',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                doc = await FirebaseFirestore.instance
                    .collection('all_resdant_database')
                    .where('id number', isEqualTo: idT.text)
                    .get()
                    .then((value) {
                  if (value.docs.isNotEmpty) {
                    check = value.docs[0].data();
                    setState(() {});
                  } else {
                    check = null;
                    setState(() {});
                  }
                });
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
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )),
                    DataTable(
                      columns: [
                        DataColumn(
                            label: Text('ID',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Name',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('House no',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text(check?['id number'])),
                          DataCell(Text(
                              '${check?['first name']} ${check?['last name']}')),
                          DataCell(Text(check?['house number'])),
                        ]),
                      ],
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        onPressed: () {},
                        child: Text('Delete',
                            style: TextStyle(
                              fontSize: 30,
                            )))
                  ]),
                )
              : Container(
                  child: Text(
                    'Not foundFound',
                    style: TextStyle(color: Colors.red),
                  ),
                )
        ]),
      ),
    );
  }
}
