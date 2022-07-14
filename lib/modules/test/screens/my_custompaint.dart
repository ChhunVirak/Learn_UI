import 'package:flutter/material.dart';

class MyCustomPaint extends StatelessWidget {
  const MyCustomPaint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          foregroundPainter: MyPainter(),
          //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          // painter: MyPainter(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width;
    double h = size.height - 50;
    var paint = Paint()
      ..color = const Color.fromARGB(255, 151, 169, 187)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, h * 0.6);
    path.quadraticBezierTo(w * 0.001, h * 0.745, w * 0.3, h * 0.75);
    path.quadraticBezierTo(w * 0.999, h * 0.745, w, h * 0.9);
    path.lineTo(w, 0);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyPainter oldDelegate) => false;
}
