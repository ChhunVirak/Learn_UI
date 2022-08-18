import 'package:flutter/material.dart';

class DragableScrollableWidget extends StatelessWidget {
  const DragableScrollableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          controller: DraggableScrollableController(),
          maxChildSize: 0.9,
          minChildSize: 0.2,
          initialChildSize: 0.5,
          builder: (context, scrollController) => Container(
            color: Colors.white,
            child: ListView.builder(
              controller: ScrollController(),
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Hello $index'),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
