import 'package:flutter/material.dart';

import '../../../widgets/enhance_dropdown.dart';

class NavigationPaint extends StatelessWidget {
  const NavigationPaint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: EnhancedDropDown(
            itemCount: 20,
            itembuilder: (context, index, model) => const Text('data'),
            dataSource: const [],
          ),
        ));
  }
}
