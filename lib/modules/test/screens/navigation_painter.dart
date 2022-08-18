import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationPaint extends StatefulWidget {
  const NavigationPaint({Key? key}) : super(key: key);

  @override
  State<NavigationPaint> createState() => _NavigationPaintState();
}

class _NavigationPaintState extends State<NavigationPaint> {
  bool click = false;

  void buttonClick(BuildContext context) {
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     // padding: const EdgeInsets.symmetric(horizontal: 20),
    //     // dismissDirection: DismissDirection.up,
    //     // action: SnackBarAction(
    //     //   label: 'hello',
    //     //   onPressed: () {},
    //     // ),
    //     behavior: SnackBarBehavior.floating,
    //     backgroundColor: Colors.transparent,

    //     content: Stack(
    //       children: const [
    //         SnackContainer(),
    //         // const CircularProgressIndicator(
    //         //   value: 1,
    //         // )
    //       ],
    //     ),
    //     elevation: 0,
    //     // padding: EdgeInsets.zero,
    //     // shape: const StadiumBorder(),
    //   ),
    // );
    click = true;
    setState(() {});
    Timer(const Duration(milliseconds: 200), () {
      click = false;
      debugPrint('Worlk');
      setState(() {});
    });
  }

  final globalKey = GlobalKey();
  final globalKey1 = GlobalKey();
  final globalKey2 = GlobalKey();
  final globalKey3 = GlobalKey();
  OverlayState? overlayState;
  OverlayEntry? overlayEntry;
  void showOverlay(BuildContext context, GlobalKey key,
      {double padding = 10}) async {
    overlayState = Overlay.of(context);
    // var renderBox = key.currentContext!.findRenderObject();
    var renderBox = key.currentContext!.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    debugPrint(offset.toString());

    ///handle textposition
    Offset textOffset = Offset.zero;
    if (offset.dy < MediaQuery.of(context).size.height / 2) {
      textOffset =
          Offset(0, offset.dy + (padding / 2) + size.height + padding + 10);
      debugPrint('if');
    } else {
      textOffset = Offset(0, offset.dy - padding - 50);
      debugPrint('else');
    }

    overlayEntry = OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            overlayEntry!.remove();
          },
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              /// Mask layer color
              Colors.black26,
              BlendMode.srcOut,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    /// Any color
                    color: Colors.white,
                    backgroundBlendMode: BlendMode.dstOut,
                  ),
                ),
                Positioned(
                  top: offset.dy - padding / 2,
                  left: offset.dx - padding / 2,
                  child: Container(
                    width: size.width + padding,
                    height: size.height + padding,

                    /// Any color

                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Positioned(
                  top: textOffset.dy,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Text(
                      'Step 1 : Click on this button and you can enable airplane mode.',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        shadows: [
                          const Shadow(color: Colors.grey, blurRadius: 1),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );

    overlayState!.insert(overlayEntry!);
  }

  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 1), () {
    //   showOverlay(context, globalKey2);
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deep = 6;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            key: globalKey1,
            height: 50,
            width: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                onPressed: () {
                  buttonClick(context);
                  // showOverlay(context, globalKey1);
                },
                child: const Icon(CupertinoIcons.airplane)),
          ),
          SizedBox(
            key: globalKey2,
            height: 50,
            width: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                onPressed: () {
                  showOverlay(context, globalKey2);
                },
                child: const Icon(CupertinoIcons.airplane)),
          ),
          // CustomPaint(
          //   painter: NavigationPainter(),
          // ),
          SizedBox(
            key: globalKey3,
            height: 50,
            width: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                onPressed: () {
                  showOverlay(context, globalKey3);
                },
                child: const Icon(CupertinoIcons.airplane)),
          ),
          Center(
            child: GestureDetector(
              onPanEnd: (v) {
                showOverlay(context, globalKey);
                // buttonClick(context);
              },
              child: AnimatedContainer(
                key: globalKey,
                duration: const Duration(milliseconds: 200),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: click
                      ? []
                      : [
                          // BoxShadow(
                          //   color: Colors.grey[300]!,
                          // ),
                          // const BoxShadow(
                          //   color: Colors.white,
                          //   spreadRadius: -12.0,
                          //   blurRadius: 12.0,
                          // ),
                          BoxShadow(
                            color: Colors.white70,
                            spreadRadius: 0.1,
                            blurRadius: 6,
                            offset: Offset(-deep, -deep),
                          ),
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 0.1,
                            blurRadius: 6,
                            offset: Offset(deep, deep),
                          ),
                        ],
                ),
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: click ? Colors.red : Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SnackContainer extends StatelessWidget {
  const SnackContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      // margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        // color: Colors.red[700],
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Colors.red[900]!,
            Colors.red[700]!,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Warining',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white),
          ),
          Expanded(
            child: Text(
              'Do not enter the negative amount.'
              'Do not enter the negative amount.'
              'Do not enter the negative amount.'
              'Do not enter the negative amount.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.white),
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width;
    double h = size.height;
    Paint _paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    Path _path = Path();

    _path.moveTo(0, 0);
    _path.relativeQuadraticBezierTo(1, 1, w * 0.2, h * 0.3);
    _path.close();
    // canvas.drawPath(_path, _paint);
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 30,
    );
    const textSpan = TextSpan(
      text: 'សួស្ដី.',
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    const offset = Offset(50, 100);
    // textPainter.
    textPainter.paint(canvas, offset);

    // canvas.drawColor(color, BlendMode.multiply);
  }

  @override
  bool shouldRepaint(NavigationPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(NavigationPainter oldDelegate) => false;
}
