import 'package:flutter/material.dart';

enum STEPSTYLE { increase, dot }

class Touring extends StatefulWidget {
  final Color? stepcolor;
  final Color? backstepcolor;
  final Curve? curve;
  final Duration? duration;
  final int itemcount;
  final IndexedWidgetBuilder itembuilder;
  final STEPSTYLE stepstyle;
  final VoidCallback? onEnd;
  final VoidCallback? onSkip;
  const Touring({
    Key? key,
    required this.itemcount,
    required this.itembuilder,
    this.stepcolor,
    this.stepstyle = STEPSTYLE.increase,
    this.onEnd,
    this.backstepcolor,
    this.curve,
    this.duration,
    this.onSkip,
  }) : super(key: key);

  @override
  State<Touring> createState() => _TouringState();
}

class _TouringState extends State<Touring> {
  Widget showStepBar(
      {required double width,
      required int step,
      double space = 5.0,
      int? currentPage}) {
    double itemWidth = (width - (space * (step + 1)) - 50) / step;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: step,
      itemBuilder: (v, index) {
        return Row(
          children: [
            SizedBox(
              width: index == 0 ? space : 0,
            ),
            widget.stepstyle == STEPSTYLE.dot
                ? Container(
                    height: 3,
                    width: itemWidth,
                    decoration: BoxDecoration(
                      color: widget.backstepcolor ?? Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.centerLeft,
                    child: AnimatedContainer(
                      curve: widget.curve ?? Curves.linear,
                      duration:
                          widget.duration ?? const Duration(milliseconds: 500),
                      width: currentPage! == index ? itemWidth : 0,
                      height: 3,
                      decoration: BoxDecoration(
                        color: currentPage == index
                            ? widget.stepcolor ?? Colors.red
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                : Container(
                    height: 3,
                    width: itemWidth,
                    decoration: BoxDecoration(
                      color: widget.backstepcolor ?? Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.centerLeft,
                    child: AnimatedContainer(
                      curve: widget.curve ?? Curves.linear,
                      duration:
                          widget.duration ?? const Duration(milliseconds: 200),
                      width: currentPage! >= index ? itemWidth : 0,
                      height: 3,
                      decoration: BoxDecoration(
                        color: currentPage >= index
                            ? widget.stepcolor ?? Colors.red
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
            SizedBox(
              width: space,
            ),
          ],
        );
      },
    );
  }

  final pageController = PageController();
  int page = 0;

  nextPage(int pag) {
    pageController.animateToPage(pag,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  previousPage(int pag) {
    pageController.animateToPage(pag,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.red[100],
                  height: 50,
                  // padding: const EdgeInsets.symmetric(vertical: 10),
                  // color: Colors.blue,
                  child: showStepBar(
                      width: width,
                      step: widget.itemcount,
                      space: 5,
                      currentPage: page),
                ),
                Expanded(
                  child: PageView.builder(
                    pageSnapping: true,
                    controller: pageController,
                    itemCount: widget.itemcount,
                    onPageChanged: (int index) {
                      setState(() {
                        page = index;
                      });
                    },
                    itemBuilder: widget.itembuilder,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            if (page > 0) {
                              page--;
                            } else if (page == 0) {
                              // Navigator.pop(context);
                            }
                            previousPage(page);
                          });
                        },
                        child: Text(page == 0 ? 'Back' : 'Previous'),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            if (page < widget.itemcount - 1) {
                              page++;
                            } else {
                              widget.onEnd != null ? widget.onEnd!() : null;
                            }
                            nextPage(page);
                          });
                        },
                        child: Text(
                            page + 1 != widget.itemcount ? 'Next' : 'Finish'),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: TextButton(
                onPressed: () {
                  widget.onSkip != null ? widget.onSkip!() : null;
                },
                child: const Text('Skip'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
