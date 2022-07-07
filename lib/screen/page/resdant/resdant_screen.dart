import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ResdantOption extends StatefulWidget {
  ResdantOption({Key? key}) : super(key: key);

  @override
  State<ResdantOption> createState() => _ResdantOptionState();
}

class _ResdantOptionState extends State<ResdantOption> {
  int defaultChoiceIndex = 0;

  List<String> _choicesList = ['YES', 'NO'];
  Map<String, dynamic> map = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/b3.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          opacity: .9,
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'images/${map['item']}.jpg',
                          ))),
                  height: 200,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${map['item']}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40),
                      ),
                      Text(
                        'price: ${map['price']}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text('Are you going to take?'),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              spacing: 8,
              children: List.generate(_choicesList.length, (index) {
                return ChoiceChip(
                  labelPadding: EdgeInsets.all(2.0),
                  label: Text(
                    _choicesList[index],
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.white, fontSize: 24),
                  ),
                  selected: defaultChoiceIndex == index,
                  selectedColor: Colors.deepPurple,
                  onSelected: (value) {
                    setState(() {
                      defaultChoiceIndex = value ? index : defaultChoiceIndex;
                    });
                  },
                  // backgroundColor: color,
                  elevation: 1,
                );
              }),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              width: 200,
              height: 75,
              child: ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('CoustomerFeedback')
                      .add({
                    'id': '',
                    'item': '${map['item']}',
                    'isTaking': _choicesList[defaultChoiceIndex],
                  });
                },
                child: Text(
                  'Send',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
