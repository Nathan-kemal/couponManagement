import 'package:flutter/material.dart';

class CCResdant extends StatefulWidget {
  const CCResdant({Key? key}) : super(key: key);

  @override
  State<CCResdant> createState() => _CCResdantState();
}

class _CCResdantState extends State<CCResdant> {
  String selectedValue = 'milk';
  List<String> list = [
    'suger',
    'milk',
    'flower',
    'oil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              value: selectedValue,
              icon: Icon(Icons.keyboard_arrow_down),
              items: list
                  .map((String e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                selectedValue = value as String;
                setState(() {});
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'price', border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Send'))
        ],
      ),
    );
  }
}
