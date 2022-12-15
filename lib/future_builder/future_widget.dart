import 'package:flutter/material.dart';

class FutureWidget<T> extends StatefulWidget {
  final Future? future;
  final Widget Function()? onWaiting;
  final Widget Function()? onDone;
  final Widget Function()? onError;

  const FutureWidget({
    Key? key,
    this.future,
    this.onDone,
    this.onWaiting,
    this.onError,
  }) : super(key: key);

  @override
  State<FutureWidget> createState() => _FutureWidgetState();
}

class _FutureWidgetState<T> extends State<FutureWidget> {
  bool loading = true;
  bool error = true;
  @override
  void initState() {
    _future();
    super.initState();
  }

  _future() {
    try {
      widget.future?.whenComplete(() {
        debugPrint('Success Nov');
        loading = false;
        setState(() {});
      }).catchError((_) {});
    } catch (_) {
      debugPrint('Error Nov');
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading ? widget.onWaiting!() : widget.onDone!();
  }
}
