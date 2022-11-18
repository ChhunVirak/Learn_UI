import 'package:flutter/material.dart';

import 'body_text.dart';

class TextContent extends StatelessWidget {
  final String? name;
  final String? data;
  const TextContent({
    Key? key,
    required this.name,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: BodyText(name ?? ''),
          ),
          const BodyText(': '),
          Expanded(
            flex: 3,
            child: BodyText(data ?? ''),
          ),
        ],
      ),
    );
  }
}
