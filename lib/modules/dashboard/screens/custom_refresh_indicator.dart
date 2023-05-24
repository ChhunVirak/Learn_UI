import 'package:flutter/material.dart';

class CustomRefreshIndicator extends StatefulWidget {
  final RefreshCallback onRefresh;
  final Widget child;
  const CustomRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  @override
  State<CustomRefreshIndicator> createState() => _CustomRefreshIndicatorState();
}

class _CustomRefreshIndicatorState extends State<CustomRefreshIndicator> {
  double overScrolled = 0;
  bool onListener(OverscrollNotification overscroll) {
    setState(() {
      overScrolled = overscroll.overscroll + 10;
    });
    // debugPrint('OverScroll => ${overscroll.overscroll}');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NotificationListener(onNotification: onListener, child: widget.child),
        AnimatedPositioned(
          top: overScrolled,
          left: 0,
          right: 0,
          duration: const Duration(milliseconds: 200),
          child: const Text('Refresh'),
        ),
      ],
    );
  }
}
