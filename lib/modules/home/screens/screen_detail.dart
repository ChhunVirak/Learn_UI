import 'package:change_language/modules/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  final int? id;

  const DetailScreen({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final bookController = Get.put(BookController());

  @override
  void initState() {
    super.initState();
    bookController.fetchBookDetail(widget.id!);
  }

  Widget customBuyButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 70),
        child: Text(
          'Buy Now',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _heigh = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Obx(
        () => bookController.loading.value
            ? const Center(
                child: CupertinoActivityIndicator(
                  radius: 20,
                ),
              )
            : Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    height: _heigh,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              bookController.bookDetail.value.image!),
                        ),
                      ),
                      height: _heigh / 2,
                    ),
                  ),

                  ///
                  Positioned(
                    bottom: 0,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25),
                            ),
                          ),
                          height: (_heigh / 2) + 20,
                          width: _width,
                          // alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 35),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        bookController.bookDetail.value.title ??
                                            '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              // overflow: TextOverflow.ellipsis,
                                            ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.bookmark,
                                      color: Colors.amber[700],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'by ${bookController.bookDetail.value.authors ?? 'unknown'}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                // const SizedBox(height: 1),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    showStar(),
                                    const SizedBox(width: 5),
                                    Text(
                                      '5.0',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: Colors.amber[700],
                                              fontSize: 14),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      '(1534)',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: Colors.amber[700],
                                              fontSize: 14),
                                    ),
                                    const Spacer(),
                                    Text(
                                      bookController.bookDetail.value.price ==
                                              null
                                          ? 'Unavialable'
                                          : '${bookController.bookDetail.value.price}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'About the book',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  bookController.bookDetail.value.desc ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(height: 1.5),
                                ),
                              ],
                            ),
                          ),
                        ),
                        customBuyButton(context),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  showStar() {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 16,
          color: Colors.amber[700],
        ),
        const SizedBox(width: 5),
        Icon(
          Icons.star,
          size: 16,
          color: Colors.amber[700],
        ),
        const SizedBox(width: 5),
        Icon(
          Icons.star,
          size: 16,
          color: Colors.amber[700],
        ),
        const SizedBox(width: 5),
        Icon(
          Icons.star,
          size: 16,
          color: Colors.amber[700],
        ),
        const SizedBox(width: 5),
        Icon(
          Icons.star,
          size: 16,
          color: Colors.amber[700],
        ),
      ],
    );
  }
}
