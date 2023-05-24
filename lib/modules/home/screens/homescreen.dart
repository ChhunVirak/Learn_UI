import 'package:change_language/modules/home/controllers/home_controller.dart';
import 'package:change_language/modules/home/screens/screen_detail.dart';
import 'package:change_language/widgets/home/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final bookController = Get.put(BookController());

  @override
  void initState() {
    bookController.fetchListBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books"),
      ),
      body: SafeArea(
        child: Obx(
          () => bookController.loading.value
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : GridView.count(
                  padding: const EdgeInsets.all(20),
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.4,
                  crossAxisCount: 3,
                  children: bookController.bookList
                      .asMap()
                      .entries
                      .map(
                        (e) => CustomCard(
                          onTap: () {
                            debugPrint('Success ${e.value.isbn13}');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  id: e.value.isbn13,
                                ),
                              ),
                            );
                          },
                          title: e.value.title,
                          price: e.value.price,
                          imgUrl: e.value.image,
                        ),
                      )
                      .toList(),
                ),
        ),
      ),
    );
  }
}
