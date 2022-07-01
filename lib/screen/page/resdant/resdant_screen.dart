import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ResdantOption extends StatefulWidget {
  ResdantOption({Key? key}) : super(key: key);

  @override
  State<ResdantOption> createState() => _ResdantOptionState();
}

class _ResdantOptionState extends State<ResdantOption> {
  int? defaultChoiceIndex;

  List<String> _choicesList = ['YES', 'NO'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.blue,
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 200,
                  child: Center(
                    child: Text(
                      'Flower Has Arrived',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
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
              onPressed: () {},
              child: Text(
                'Send',
                style: TextStyle(fontSize: 30),
              ),
            ),
          )
        ],
      ),
    );
  }
}
