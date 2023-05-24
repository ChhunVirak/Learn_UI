import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String? text;
  const HeaderText(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
