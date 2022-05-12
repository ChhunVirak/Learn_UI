import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int number = 0;

  returnColor(int numb) {
    return Color(0xff288447 + (numb * 5));
    // if (numb == 0) {
    //   return Colors.red;
    // } else if (numb == 1) {
    //   return Colors.green;
    // } else {
    //   return Colors.indigo;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.rotate(
                angle: 3 * 3.14 / 2,
                child: CircleAvatar(
                  radius: 100,
                  child: Text(
                    '$number',
                    style: const TextStyle(
                        fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: returnColor(number),
                  // number == 0
                  //     ? (Colors.red)
                  //     : (number == 1 ? Colors.green : Colors.blue),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        number--;
                      });
                    },
                    child: const Text('-'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        number = 0;
                      });
                    },
                    child: const Text('0'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        number++;
                      });
                    },
                    child: const Text('+'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
