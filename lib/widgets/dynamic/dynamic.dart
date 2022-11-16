import 'package:change_language/widgets/dynamic/dynamic_type.dart';
import 'package:flutter/material.dart';

class DynamicWidget extends StatefulWidget {
  final String? type;
  const DynamicWidget({Key? key, required this.type}) : super(key: key);

  @override
  State<DynamicWidget> createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget> {
  Widget getWidget(String? type) {
    switch (type) {
      case DynamicType.container:
        return Container();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return getWidget(widget.type);
  }
}
