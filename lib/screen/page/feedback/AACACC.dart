import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AACACCScreen extends StatefulWidget {
  String? type;
  String? name;
  AACACCScreen({Key? key, required this.type, required this.name})
      : super(key: key);

  @override
  State<AACACCScreen> createState() => _AACACCScreenState();
}

class _AACACCScreenState extends State<AACACCScreen> {
  String? arg = Get.arguments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212333),
      body: widget.type == 'AACA'
          ? StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Messages')
                  .where('sender', isNotEqualTo: arg)
                  .snapshots(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      return snapshot.data?.docs != null
                          ? Card(
                              color: Color(0xff292D3F),
                              child: Container(
                                height: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${snapshot.data?.docs[index].get('feedback')}',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Center(child: CircularProgressIndicator());
                    });
              },
            )
          : StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('all_cc_database')
                  .doc(widget.name)
                  .collection('feedbacks')
                  .doc('Customer')
                  .collection('feedback')
                  .snapshots(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      return snapshot.data?.docs != null
                          ? Card(
                              color: Color(0xff292D3F),
                              child: Container(
                                height: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${snapshot.data?.docs[index].get('feedback')}',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Center(child: CircularProgressIndicator());
                    });
              },
            ),
    );
  }
}
