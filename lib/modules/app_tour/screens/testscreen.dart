import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

class Apptour extends StatefulWidget {
  const Apptour({Key? key}) : super(key: key);

  @override
  State<Apptour> createState() => _ApptourState();
}

class _ApptourState extends State<Apptour> {
  bool change = true;
  int elapsed = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // Touring(
          //   duration: const Duration(milliseconds: 200),
          //   stepcolor: Colors.teal,
          //   backstepcolor: Colors.red[100],
          //   stepstyle: STEPSTYLE.increase,
          //   itemcount: images.length,
          //   itembuilder: (BuildContext context, int index) => Container(
          //     color: Colors.blue,
          //     padding: const EdgeInsets.all(20.0),
          //     child: Image.network(images[index]),
          //   ),
          //   onEnd: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const HomeScreen(),
          //       ),
          //     );
          //   },
          //   onSkip: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const HomeScreen(),
          //       ),
          //     );
          //   },
          // ),
          SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: AnimatedSwitcher(
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: Text(
              "$elapsed",
              key: ValueKey(elapsed),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(Random().nextInt(0xffffffff)).withAlpha(0xff)),
            ),
            duration: const Duration(seconds: 1),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            final cd = CountdownTimer(
                const Duration(seconds: 10), const Duration(seconds: 1),
                stopwatch: Stopwatch());
            cd.listen((data) {
              setState(() {
                elapsed = cd.elapsed.inSeconds;
              });
            }, onDone: () {
              cd.any((element) => false);
            });
          },
          child: const Icon(Icons.text_increase)),
    );
  }
}
