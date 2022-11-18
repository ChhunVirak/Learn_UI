import 'package:flutter/material.dart';

class Paper extends StatelessWidget {
  final Widget child;
  const Paper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}
