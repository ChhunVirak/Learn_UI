import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'test_phone_controller.dart';

class TestPhone extends GetView<TestPhoneController> {
  const TestPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform.rotate(
          angle: -pi / 2,
          child: SizedBox(
            width: 200,
            height: 200,
            // color: Colors.blue,
            child: Obx(() => CustomPaint(
                  painter: ClockPainter(tick: controller.tick.value),
                )),
          ),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final int tick;
  ClockPainter({this.tick = 0});
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final middle = Offset(w / 2, h / 2);

    ///bg
    final paint = Paint()..color = Colors.purple;
    final rect = Rect.fromCircle(center: middle, radius: 100);
    canvas.drawOval(rect, paint);

    ///border
    final paintBorder = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawOval(rect, paintBorder);
    final paintHour = Paint()
      ..color = Colors.red
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    ///hour
    // for (double i = 0; i < 360; i += 12) {
    var test = 6 * tick;
    final dx = 100 + 100 * cos(test * pi / 180);
    final dy = 100 + 100 * sin(test * pi / 180);
    Offset point = Offset(dx, dy);

    // }
    canvas.drawLine(middle, point, paintHour);

    ///dot
    final paintDot = Paint()..color = Colors.grey;
    final rectDot = Rect.fromCircle(center: const Offset(100, 100), radius: 15);
    canvas.drawOval(rectDot, paintDot);
  }

  @override
  bool shouldRepaint(ClockPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(ClockPainter oldDelegate) => false;
}
