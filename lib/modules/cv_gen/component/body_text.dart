import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  final String? text;
  const BodyText(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: Theme.of(context).textTheme.subtitle2,
    );
  }
}
