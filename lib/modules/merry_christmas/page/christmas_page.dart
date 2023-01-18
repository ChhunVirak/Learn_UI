import 'package:change_language/modules/merry_christmas/page/custom_dropdown.dart';
import 'package:flutter/material.dart';

class ChristMasPage extends StatefulWidget {
  const ChristMasPage({super.key});

  @override
  State<ChristMasPage> createState() => _ChristMasPageState();
}

class _ChristMasPageState extends State<ChristMasPage> {
  // AnimationController? _animationController;

  @override
  void initState() {
    // _animationController =
    //     AnimationController(vsync: this, duration: const Duration(seconds: 3));
    // _animationController?.forward();
    // _animationController?.addListener(() {
    //   setState(() {});
    // });
    super.initState();
  }

  @override
  void dispose() {
    // _animationController?.dispose();
    super.dispose();
  }

  int selected = 0;

  final _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final start = MediaQuery.of(context).size.centerLeft(const Offset(1, 10));
    final end = MediaQuery.of(context).size.centerRight(const Offset(1, 10));
    debugPrint('$start $end');
    return const Scaffold(
      // backgroundColor: Colors.black,
      body: Center(
        child: CustomDropDownButton(),
      ),
    );
  }
}
