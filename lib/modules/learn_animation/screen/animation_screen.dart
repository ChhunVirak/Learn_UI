import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  double height = 50.0;
  double buttonWidth = 100;
  bool select = true;

  bool longPressd = false;

  // _onLongPressStart() {
  //   setState(() {
  //     longPressd = true;
  //   });
  // }

  // _onLongPressEnd() {
  //   setState(() {
  //     longPressd = false;
  //   });
  // }

  // _onTappedHandler() {
  //   setState(() {
  //     select = !select;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          child: Row(),
        ),
      ),
    );
  }
}

extension SizB on num {
  Widget get width => SizedBox(width: toDouble());
  Widget get height => SizedBox(height: toDouble());
}
