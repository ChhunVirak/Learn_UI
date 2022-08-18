import 'package:flutter/material.dart';

class MyCustomPaint extends StatelessWidget {
  const MyCustomPaint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff121212),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomPaint(
              painter: _ShadowPaint(
                shadowColor: Colors.red,
                offset: const Offset(0, 10),
              ),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.green[900],
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Test Shadow',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ShadowPaint extends CustomPainter {
  final Color? shadowColor;

  final Offset? offset;

  _ShadowPaint({
    required this.shadowColor,
    this.offset,
  });
  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width;
    double h = size.height;

    final _centerPoint = Offset(w / 2, h / 2 + offset!.dy);

    final _shadow =
        Rect.fromCenter(center: _centerPoint, width: w - 50, height: h);
    var _shadowPaint = Paint()
      ..color = const Color(0xff121212).withOpacity(0.9)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
    canvas.drawRect(_shadow, _shadowPaint);

    // canvas.drawRRect(_rRect, _paint);
  }

  @override
  bool shouldRepaint(_ShadowPaint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_ShadowPaint oldDelegate) => false;
}
