import 'package:coupon_manegement/screen/page/resdant_screen.dart';
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

  final Stream<QuerySnapshot> ccstream = FirebaseFirestore.instance
      .collection('all_cc_database')
      .snapshots(includeMetadataChanges: true);

  var seleectedCC;
  final GlobalKey<FormState> _formKeyValue = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
              height: 50,
            ),
            Text(
              'CC Place to Receive From',
              style: TextStyle(
                fontSize: 20,
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
                              color: Colors.black,
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
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                color: Color(0xff11b719),
                textColor: Colors.white,
                child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Send", style: TextStyle(fontSize: 24.0)),
                      ],
                    )),
                onPressed: () {
                  Get.defaultDialog(
                      onConfirm: () {
                        try {
                          // FirebaseFirestore.instance
                          //     .collection('CoustomerFeedback')
                          //     .add({
                          //   'id': '',
                          //   'item': '${map['item']}',
                          //   'isTaking': _choicesList[defaultChoiceIndex],
                          // }).whenComplete(() => Get.off(() => ResdantScreen()));

                          FirebaseFirestore.instance
                              .collection('all_cc_database')
                              .doc(seleectedCC)
                              .collection('feedbacks')
                              .doc('Customer')
                              .collection('feedback')
                              .add({
                            'id': map['id'],
                            'first name': map['first name'],
                            'last name': map['last name'],
                            'item': '${map['item']}',
                            'isTaking': _choicesList[defaultChoiceIndex],
                          }).whenComplete(() => Get.off(() => ResdantScreen()));
                        } catch (e) {}
                      },
                      onCancel: () {},
                      title: "Confirm",
                      backgroundColor: Color(0xff212333),
                      titleStyle: TextStyle(color: Colors.white),
                      middleTextStyle: TextStyle(color: Colors.white),
                      textConfirm: "Confirm",
                      textCancel: "Cancel",
                      cancelTextColor: Colors.white,
                      confirmTextColor: Colors.white,
                      buttonColor: Colors.red,
                      barrierDismissible: false,
                      content: Column(
                        children: [
                          Text(
                            'Are you Going to Take the Item',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ));
                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
