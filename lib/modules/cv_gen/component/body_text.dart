import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  final String? text;
  const BodyText(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final isLink = text != null && text!.contains('.com');
    return Text(
      text ?? '',
      // style: Theme.of(context).textTheme.subtitle2?.copyWith(
      //       color: isLink ? const Color(0xff0000FF) : Colors.black,
      //       decoration: isLink ? TextDecoration.underline : null,
      //     ),
    );
  }
}
