import 'package:flutter/material.dart';

class AACAScreen extends StatefulWidget {
  const AACAScreen({Key? key}) : super(key: key);

  @override
  State<AACAScreen> createState() => _AACAScreenState();
}

class _AACAScreenState extends State<AACAScreen> {
  bool? isCheked = true;
  List<String> list = [
    'AA',
    'BB',
    'CC',
    'DD',
    'EE',
    'FF',
    'GG',
  ];
  String selectedValue = 'BB';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 5,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'Feedback',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Container(
              width: 100,
              child: DropdownButtonFormField(
                   decoration: const InputDecoration(
                  border: OutlineInputBorder(),
            ),
                value: selectedValue,
                icon: Icon(Icons.keyboard_arrow_down),
                items: list
                    .map((String e) =>
                        DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  selectedValue = value as String;
                  setState(() {});
                },
              ),
            ),
            CheckboxListTile(
              value: isCheked,
              onChanged: (value) {
                isCheked = value;

                setState(() {});
              },
              title: Text('Send To ALL'),
            ),
            Container(
                width: 200,
                child: ElevatedButton(onPressed: () {}, child: Text('Send')))
          ],
        ),
      ),
    );
  }
}
