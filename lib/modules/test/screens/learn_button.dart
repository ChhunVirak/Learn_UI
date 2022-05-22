import 'package:flutter/material.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({Key? key}) : super(key: key);

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  int numm = 0;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
