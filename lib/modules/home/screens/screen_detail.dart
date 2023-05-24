import 'package:cached_network_image/cached_network_image.dart';
import 'package:change_language/modules/home/controllers/book_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  final String? id;

  const DetailScreen({
    Key? key,
    this.id,
  }) : super(key: key);

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
    double heigh = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final bookController = BookDetailController();

    return Scaffold(
      body: GetBuilder<BookDetailController>(
        dispose: (state) {
          // Get.delete<BookDetailController>(
          //     force: true); //Call This if you put dependancy
        },
        init: bookController,
        initState: (s) {
          bookController.fetchBookDetail(id);
        },
        builder: (controller) => controller.obx(
          (state) => Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(state!.image!),
                    ),
                  ),
                  height: heigh / 2,
                  width: width,
                ),
              ),

              ///
              Positioned(
                bottom: 0,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        ),
                      ),
                      height: (heigh / 2) + 20,
                      width: width,
                      // alignment: Alignment.center,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 35),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    state.title ?? '',
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
                              'by ${state.authors ?? 'unknown'}',
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
                                  state.price == null
                                      ? 'Unavialable'
                                      : '${state.price}',
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
                              state.desc ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(height: 1.5),
                            ),
                            if (controller.status.isLoadingMore)
                              Text(
                                'Loading More',
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
          onError: (error) => Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Something went wrong please try again'),
              Text(error ?? ''),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Back'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      controller.fetchBookDetail(id);
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ],
          )),
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
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
