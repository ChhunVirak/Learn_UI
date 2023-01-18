import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  final _dateTime = DateTime.now();

  WelcomeText({super.key});

  String _current() => _dateTime.hour < 12
      ? 'Morning'
      : _dateTime.hour > 12
          ? 'Afternoon'
          : _dateTime.hour < 19
              ? 'Evening'
              : 'Night';

  @override
  Widget build(BuildContext context) {
    return Text('Good ${_current()}');
  }
}
