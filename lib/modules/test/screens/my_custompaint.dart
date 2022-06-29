import 'package:flutter/material.dart';

class MyCustomPaint extends StatelessWidget {
  const MyCustomPaint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Center(
        child: Container(
          color: Colors.black,
          height: 300,
          width: 300,
          child: CustomPaint(
            //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: MyPainter(),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    final arc1 = Path();

    arc1.moveTo(0, 0);
    arc1.relativeCubicTo(1, 2, 3, 4, 5, 6);

    ///
    // arc1.moveTo(size.width * 0.5, 0);
    // arc1.lineTo(size.width * 0.1, 0);
    // arc1.relativeArcToPoint(Offset(0, size.height * 0.1), clockwise: true);
    // arc1.lineTo(0, size.height * 0.9);
    // arc1.arcToPoint(
    //   Offset(size.width * 0.1, size.height),
    //   clockwise: false,
    //   radius: const Radius.circular(30),
    // );
    // arc1.lineTo(size.width * 0.9, size.height);
    // arc1.arcToPoint(
    //   Offset(size.width, size.height * 0.9),
    //   clockwise: false,
    //   radius: const Radius.circular(30),
    // );
    // arc1.lineTo(size.width, size.height * 0.8);
    // arc1.arcToPoint(
    //   Offset(size.width * 0.9, size.height * 0.7),
    //   // clockwise: false,
    //   // radius: const Radius.circular(40),
    // );
    // arc1.lineTo(size.width * 0.9, size.height * 0.3);
    // arc1.arcToPoint(
    //   Offset(size.width, size.height * 0.2),
    //   // clockwise: false,
    //   // radius: const Radius.circular(50),
    // );
    // arc1.lineTo(size.width, size.height * 0.1);
    // // arc1.quadraticBezierTo(x1, y1, x2, y2)
    // arc1.arcToPoint(
    //   Offset(size.width * 0.9, 0),
    //   clockwise: false,
    //   radius: const Radius.circular(30),
    // );
    // arc1.close();
    canvas.drawPath(arc1, paint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyPainter oldDelegate) => false;
}
