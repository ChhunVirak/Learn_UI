// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AnimatedListt extends StatefulWidget {
  const AnimatedListt({Key? key}) : super(key: key);

  @override
  State<AnimatedListt> createState() => _AnimatedListtState();
}

class _AnimatedListtState extends State<AnimatedListt> {
  List<Data> data = <Data>[
    Data(),
    Data(),
    Data(),
    Data(),
    Data(),
    Data(),
    Data(),
    Data(),
    Data(),
    Data(),
    Data(),
    Data(),
    Data(),
    Data(),
    Data(),
    Data(),
    Data(),
    Data(),
    Data()
  ];

  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SafeArea(
          child: Row(
            children: data.asMap().entries.map((e) {
              return Card(
                key: e.value.key = GlobalKey(),
                child: Text('${e.key + 1} Name'),
              );
            }).toList(),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              currentindex += 1;
              scrolltoIndex(currentindex);
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  void scrolltoIndex(int index) {
    if (data.length >= index) {
      final itemContext = data[index].key?.currentContext;
      Scrollable.ensureVisible(
        itemContext!,
        alignment: 0.5,
        duration: const Duration(milliseconds: 500),
      );
    }
  }
}

class Data {
  GlobalKey? key;
  String? item;
  Data({
    this.key,
    this.item,
  });
}
