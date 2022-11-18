import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String? text;
  const TitleText(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        text ?? '',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
