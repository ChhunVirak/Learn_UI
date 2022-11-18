import 'package:flutter/material.dart';

class Draga extends StatefulWidget {
  const Draga({Key? key}) : super(key: key);

  @override
  State<Draga> createState() => _DragaState();
}

class _DragaState extends State<Draga> {
  final DraggableScrollableController _controller =
      DraggableScrollableController();

  @override
  void initState() {
    _controller.addListener(
      () {
        debugPrint('Success : ${_controller.pixels}');
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      floatingActionButton: FloatingActionButton(onPressed: () {
        _controller.animateTo(0.6,
            curve: Curves.bounceOut,
            duration: const Duration(milliseconds: 200));
      }),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.amber,
          ),
          Expanded(
            child: NotificationListener(
              onNotification: (NeverScrollableScrollPhysics v) => false,
              child: ListView(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    height: 1000,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
