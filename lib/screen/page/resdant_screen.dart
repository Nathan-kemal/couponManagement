import 'package:coupon_manegement/screen/admin/removec.dart';
import 'package:coupon_manegement/screen/page/resdant/resdant_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ResdantScreen extends StatefulWidget {
  const ResdantScreen({Key? key}) : super(key: key);

  @override
  State<ResdantScreen> createState() => _ResdantScreenState();
}

class _ResdantScreenState extends State<ResdantScreen> {
  Map mp = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/b3.jpg'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Color(0xff292D3F),
        appBar: AppBar(
          backgroundColor: Color(0xff292D3F),

          title: Text(''),
          // backgroundColor: Color(0xff212333),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('cc_to_coustomer')
              .snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  String item = '${snapshot.data?.docs[index].get('item')}';
                  Timestamp time = snapshot.data?.docs[index].get('time');
                  return InkWell(
                    onTap: () {
                      Get.to(
                        () => ResdantOption(),
                        arguments: {
                          'item': '${snapshot.data?.docs[index].get('item')}',
                          'price': '${snapshot.data?.docs[index].get('price')}',
                          'id': mp['id'],
                          'first name': mp['fn'],
                          'last name': mp['fn'],
                        },
                      );
                      // Get.to(() => MyHomePage());
                    },
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                opacity: .9,
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'images/${snapshot.data?.docs[index].get('item')!}.jpg',
                                ))),
                        height: 150,
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                'Item: ${snapshot.data?.docs[index].get('item')}',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Price: ${snapshot.data?.docs[index].get('price')}',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                'time: ${time.toDate().year}-${time.toDate().month}-${time.toDate().day}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
