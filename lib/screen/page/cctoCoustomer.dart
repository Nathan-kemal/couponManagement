import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CCToCoustomer extends StatefulWidget {
  const CCToCoustomer({Key? key}) : super(key: key);

  @override
  State<CCToCoustomer> createState() => _CCToCoustomer();
}

class _CCToCoustomer extends State<CCToCoustomer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/b3.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Messages'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('cc_to_coustomer')
              .snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      height: 150,
                      child: Center(
                          child: Column(
                        children: [
                          Text(
                            '${snapshot.data?.docs[index].get('item')}',
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(
                            '${snapshot.data?.docs[index].get('price')}',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      )),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
