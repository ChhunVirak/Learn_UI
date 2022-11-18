// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyCustomPaint extends StatefulWidget {
  const MyCustomPaint({Key? key}) : super(key: key);

  @override
  State<MyCustomPaint> createState() => _MyCustomPaintState();
}

class _MyCustomPaintState extends State<MyCustomPaint> {
  Uint8List? img;
  File? path;

  final imgs = [
    Data(data: '1'),
    Data(data: '2'),
    Data(data: '3'),
  ];

  Future<Uint8List> getUint8List(GlobalKey key) async {
    RenderRepaintBoundary boundary =
        key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 10);
    final byteData = await image.toByteData(
      format: ImageByteFormat.png,
    );
    return byteData!.buffer.asUint8List();
  }

  var list = [];
  Future addToList() async {
    for (var a in imgs) {
      list.add(await getUint8List(a.key!));
    }
    debugPrint('Error Nov');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await addToList().then((value) {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: Column(
                  children: list.map((e) => Image.memory(e)).toList(),
                ),
              ),
            );
          });
        },
      ),
      // backgroundColor: const Color(0xff121212),
      body: Stack(
        children: [
          Row(
            children: imgs
                .asMap()
                .entries
                .map((e) => RepaintBoundary(
                      key: imgs[e.key].key = GlobalKey(),
                      child: Text(
                        e.value.data,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red),
                      ),
                    ))
                .toList(),
          ),
          Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Data {
  GlobalKey? key;
  final String data;
  Data({
    this.key,
    required this.data,
  });
}

final a = {1: "", 2: ''};
