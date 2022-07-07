import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CoutomerList extends StatefulWidget {
  const CoutomerList({Key? key}) : super(key: key);

  @override
  State<CoutomerList> createState() => _CoutomerListState();
}

class _CoutomerListState extends State<CoutomerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212333),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Accounts')
              .doc('Coustomer')
              .collection('Registered')
              .snapshots(),
          builder: ((context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: ((context, index) {
                  return Expanded(
                    child: DataTable(
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
                            '${snapshot.data?.docs[index].get('id number')}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                          DataCell(Text(
                            '${snapshot.data?.docs[index].get('first name')},  ${snapshot.data?.docs[index].get('last name')}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                          DataCell(Text(
                            '${snapshot.data?.docs[index].get('house number')}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                        ]),
                      ],
                    ),
                  );
                }));
          })),
    );
  }
}
