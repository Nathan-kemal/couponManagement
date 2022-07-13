import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CCResdant extends StatefulWidget {
  const CCResdant({Key? key}) : super(key: key);

  @override
  State<CCResdant> createState() => _CCResdantState();
}

class _CCResdantState extends State<CCResdant> {
  String selectedValue = 'suger';
  List<String> list = [
    'suger',
    'flour',
    'oil',
  ];
  final _formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingControllerLitter = TextEditingController();
  TextEditingController textEditingControllerKg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/b3.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Color(0xff212333),
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Color(0xff212333),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                  value: selectedValue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: list
                      .map((String e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          )))
                      .toList(),
                  onChanged: (value) {
                    selectedValue = value as String;
                    setState(() {});
                  },
                ),
              ),
              selectedValue == 'oil'
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Litter should not be empty';
                          }
                        },
                        controller: textEditingControllerLitter,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Litter',
                            border: OutlineInputBorder()),
                      ),
                    )
                  : Container(),
              selectedValue == 'flour'
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Suger Kg should not be empty';
                          }
                        },
                        controller: textEditingControllerKg,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'KG',
                            border: OutlineInputBorder()),
                      ),
                    )
                  : Container(),
              selectedValue == 'suger'
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Suger Kg should not be empty';
                          }
                        },
                        controller: textEditingControllerKg,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'KG',
                            border: OutlineInputBorder()),
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Price should not be empty';
                    }
                  },
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'price',
                      border: OutlineInputBorder()),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (selectedValue == 'oil') {
                        FirebaseFirestore.instance
                            .collection('cc_to_coustomer')
                            .add(
                          {
                            'item': '$selectedValue',
                            'Liter': '${textEditingControllerLitter.text}',
                            'price': '${textEditingController.text}',
                            'time': Timestamp.now()
                          },
                        );
                      } else {
                        FirebaseFirestore.instance
                            .collection('cc_to_coustomer')
                            .add(
                          {
                            'item': '$selectedValue',
                            'Liter': '${textEditingControllerKg.text}',
                            'price': '${textEditingController.text}',
                            'time': Timestamp.now()
                          },
                        );
                      }
                    }

                    //cc_to_coustomer
                  },
                  child: Text('Send'))
            ],
          ),
        ),
      ),
    );
  }
}
