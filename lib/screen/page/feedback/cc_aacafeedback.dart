import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CCAACAFeedback extends StatefulWidget {
  String name;
  CCAACAFeedback({Key? key, required this.name}) : super(key: key);
  @override
  State<CCAACAFeedback> createState() => _CCAACAFeedbackState();
}

class _CCAACAFeedbackState extends State<CCAACAFeedback> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('all_cc_database')
          .doc(widget.name)
          .collection('feedbacks')
          .doc('AACA')
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
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${snapshot.data?.docs[index].get('sender')}',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              '${snapshot.data?.docs[index].get('feedback')}',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Center(child: CircularProgressIndicator());
            });
      },
    );
  }
}
