import 'package:flutter/material.dart';
import 'dart:math' as math;

class LearnCustomPaint extends StatefulWidget {
  const LearnCustomPaint({Key? key}) : super(key: key);

  @override
  _LearnCustomPaintState createState() => _LearnCustomPaintState();
}

class _LearnCustomPaintState extends State<LearnCustomPaint>
    with SingleTickerProviderStateMixin {
  final _radius = 100.0;

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    Tween<double> _rotationTween = Tween(begin: -math.pi, end: math.pi);

    animation = _rotationTween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualizer'),
      ),
      body: Center(
        child: CustomPaint(
          foregroundPainter: PointPainter(_radius, animation.value),
          painter: CirclePainter(_radius),
        ),
      ),
    );
  }
}

// FOR PAINTING THE CIRCLE
class CirclePainter extends CustomPainter {
  final double radius;
  CirclePainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var paint1 = Paint()
      ..color = Colors.red
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();
    path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius,
    ));
    canvas.drawPath(path, paint);

    var path1 = Path();
    path.addOval(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: 10,
      ),
    );
    canvas.drawCircle(const Offset(0, 0), 50, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// FOR PAINTING THE TRACKING POINT
class PointPainter extends CustomPainter {
  final double radius;
  final double radians;
  PointPainter(this.radius, this.radians);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var innerCirclePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    var paintminute = Paint()
      ..color = Colors.green
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const textSpan = TextSpan(
      text: "60",
      style: TextStyle(color: Colors.black, fontSize: 16),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: 100,
    );

    var path = Path();

    Offset center = Offset(size.width / 2, size.height / 2);

    path.moveTo(center.dx, center.dy);

    Offset pointOnCircle = Offset(
      radius * math.cos(radians) + center.dx,
      radius * math.sin(radians) + center.dy,
    );
    // if (math.cos(radians) < 0.0) {
    //   textPainter.paint(
    //     canvas,
    //     pointOnCircle + const Offset(-60, 0),
    //   );
    //   textPainter.paint(
    //     canvas,
    //     pointOnCircle + const Offset(60, 10),
    //   );
    // }
    // For showing the point moving on the circle
    // canvas.drawCircle(pointOnCircle, 10, pointPaint);

    path.lineTo(pointOnCircle.dx, pointOnCircle.dy);
    // path.lineTo(pointOnCircle.dx, center.dy);

    path.close();
    canvas.drawPath(path, paint);
    canvas.drawPath(path, paint..color = Colors.red);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
