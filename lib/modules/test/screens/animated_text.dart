import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AimatedText extends StatefulWidget {
  const AimatedText({Key? key}) : super(key: key);

  @override
  State<AimatedText> createState() => _AimatedTextState();
}

class _AimatedTextState extends State<AimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    _animationController.forward();

    _animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTween(begin: Colors.black, end: Colors.white)
          .animate(_animationController)
          .value,
      body: Center(
          child: SizedBox(
        width: 250.0,
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          child: AnimatedTextKit(
            pause: const Duration(milliseconds: 500),
            repeatForever: false,
            totalRepeatCount: 1,
            animatedTexts: [
              FadeAnimatedText('3', textAlign: TextAlign.center),
              FadeAnimatedText('2', textAlign: TextAlign.center),
              FadeAnimatedText('1', textAlign: TextAlign.center),
            ],
            onTap: () {},
          ),
        ),
      )
          // SizedBox(
          //   width: 250.0,
          //   child: TextLiquidFill(
          //     text: 'Happy Birthday',
          //     waveColor: Colors.blueAccent,
          //     boxBackgroundColor: Colors.white,
          //     textStyle: const TextStyle(
          //       fontSize: 20.0,
          //       fontWeight: FontWeight.bold,
          //     ),
          //     boxHeight: 100.0,
          //   ),
          // ),
          ),
    );
  }
}
