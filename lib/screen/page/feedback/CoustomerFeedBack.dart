import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CoustomerFeedback extends StatefulWidget {
  const CoustomerFeedback({Key? key}) : super(key: key);

  @override
  State<CoustomerFeedback> createState() => _CoustomerFeedbackState();
}

class _CoustomerFeedbackState extends State<CoustomerFeedback> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('CoustomerFeedback')
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
                                '${snapshot.data?.docs[index].get('id')}',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              '${snapshot.data?.docs[index].get('item')}',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '${snapshot.data?.docs[index].get('isTaking')}',
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
