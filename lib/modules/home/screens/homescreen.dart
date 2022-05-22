import 'dart:typed_data';

import 'package:change_language/modules/home/controllers/home_controller.dart';
import 'package:change_language/modules/home/screens/screen_detail.dart';
import 'package:change_language/widgets/home/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final bookController = Get.put(BookController());
  final controller = ScrollController();
  final key1 = GlobalKey();
  final key2 = GlobalKey();
  final key3 = GlobalKey();

  @override
  void initState() {
    bookController.fetchBookList();
    super.initState();
  }

  Future scrollToItem(int index) async {
    final _context = setkey(index).currentContext;
    await Scrollable.ensureVisible(
      _context,
      alignment: 0.5,
      curve: Curves.easeInCubic,
      duration: const Duration(milliseconds: 500),
    );
  }

  setkey(int index) {
    switch (index) {
      case 3:
        return key1;
      case 6:
        return key2;
      case 10:
        return key3;
      default:
    }
  }

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
    // onDrawStart: () => print('onDrawStart called!'),
    // onDrawEnd: () => print('onDrawEnd called!'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "News Books",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 25),
                  ),
                  const SizedBox(height: 20),
                  NotificationListener<ScrollNotification>(
                    onNotification: (v) {
                      // debugPrint('okk ${v is ScrollEndNotification}');
                      return false;
                    },
                    child: SingleChildScrollView(
                      controller: controller,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: bookController.bookList
                              .asMap()
                              .entries
                              .map(
                                (e) => CustomCard(
                                  key: setkey(e.key + 1),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                          id: int.parse(e.value.isbn13 ?? '00'),
                                        ),
                                      ),
                                    );
                                  },
                                  title: e.value.title,
                                  price: e.value.price,
                                  imgUrl: e.value.image,
                                ),
                              )
                              .toList()),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          controller.animateTo(
                            controller.position.minScrollExtent,
                            curve: Curves.linear,
                            duration: const Duration(milliseconds: 500),
                          );
                        },
                        child: const Text('Start'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          scrollToItem(3);
                        },
                        child: const Text('3'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          scrollToItem(10);
                        },
                        child: const Text('10'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.animateTo(
                            controller.position.maxScrollExtent,
                            curve: Curves.linear,
                            duration: const Duration(seconds: 1),
                          );
                        },
                        child: const Text('End'),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 15),
                      color: Colors.teal,
                      child: Signature(
                        backgroundColor: Colors.transparent,
                        controller: _controller,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _controller.undo();
                        },
                        child: const Text('Undo'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _controller.clear();
                        },
                        child: const Text('Clear'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _controller.redo();
                        },
                        child: const Text('Redo'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final Uint8List? data =
                              await _controller.toPngBytes();
                          showDialog(
                            context: context,
                            builder: (context) => Container(
                              height: 200,
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  data != null
                                      ? Image.memory(data)
                                      : Expanded(
                                          child: Container(
                                          color: Colors.white,
                                        )),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Back'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: const Text('Show'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
