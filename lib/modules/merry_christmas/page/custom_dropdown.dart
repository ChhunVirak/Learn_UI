import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({super.key});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  final _globalKey = GlobalKey();

  void _show() {
    RenderBox renderBox =
        _globalKey.currentContext!.findRenderObject() as RenderBox;

    Offset offset = renderBox.localToGlobal(Offset.zero);
    OverlayState? overlayState;
    OverlayEntry? overlay;
    overlay = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                overlay?.remove();
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            left: offset.dx,
            top: offset.dy + renderBox.size.height + 20 + 20,
            child: Material(
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 0),
                      blurRadius: 4,
                      spreadRadius: -1,
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text('Hello'),
                    ),
                    ListTile(
                      title: Text('Hello'),
                    ),
                    ListTile(
                      title: Text('Hello'),
                    ),
                    ListTile(
                      title: Text('Hello'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: offset.dx + 20,
            top: offset.dy + renderBox.size.height + 20,
            child: SizedBox(
              height: 20,
              width: 25,
              child: CustomPaint(
                painter: _Arrow(
                    isUpArrow: true,
                    strokeColor: Colors.white,
                    strokeWidth: 1,
                    paintingStyle: PaintingStyle.fill),
              ),
            ),
          )
        ],
      ),
    );
    overlayState = Overlay.of(context, rootOverlay: true);
    overlayState.insert(overlay);
    // overlayState.
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: _globalKey,
      onPressed: () {
        _show();
      },
      icon: const Icon(CupertinoIcons.hammer_fill),
    );
  }
}

class _Arrow extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;
  final bool isUpArrow;

  _Arrow(
      {this.strokeColor = Colors.black,
      this.strokeWidth = 3,
      this.paintingStyle = PaintingStyle.stroke,
      this.isUpArrow = true});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    if (isUpArrow) {
      return Path()
        ..moveTo(0, y)
        ..lineTo(x / 2, 0)
        ..lineTo(x, y)
        ..lineTo(0, y);
    } else {
      return Path()
        ..moveTo(0, 0)
        ..lineTo(x, 0)
        ..lineTo(x / 2, y)
        ..lineTo(0, 0);
    }
  }

  @override
  bool shouldRepaint(_Arrow oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
