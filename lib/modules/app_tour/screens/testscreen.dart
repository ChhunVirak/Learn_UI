import 'package:change_language/modules/app_tour/screens/app_tour.dart';
import 'package:flutter/material.dart';

import '../../home/screens/homescreen.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final images = <String>[
    'https://cdn.pixabay.com/photo/2020/12/18/00/43/business-5840872_1280.png',
    'https://cdn.pixabay.com/photo/2020/12/18/00/43/business-5840872_1280.png',
    'https://cdn.pixabay.com/photo/2020/12/18/00/43/business-5840872_1280.png',
    'https://cdn.pixabay.com/photo/2020/12/18/00/43/business-5840872_1280.png',
    'https://cdn.pixabay.com/photo/2020/12/18/00/43/business-5840872_1280.png',
    'https://cdn.pixabay.com/photo/2020/12/18/00/43/business-5840872_1280.png',
    'https://cdn.pixabay.com/photo/2020/12/18/00/43/business-5840872_1280.png',
    'https://cdn.pixabay.com/photo/2020/12/18/00/43/business-5840871_1280.png',
    'https://cdni.iconscout.com/illustration/premium/thumb/welcome-typography-with-business-people-characters-2710146-2263951.png',
    'https://cdni.iconscout.com/illustration/premium/thumb/welcome-typography-with-business-people-characters-2710146-2263951.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Touring(
        curve: Curves.elasticInOut,
        duration: const Duration(milliseconds: 500),
        stepcolor: Colors.teal,
        backstepcolor: Colors.red[100],
        stepstyle: STEPSTYLE.increase,
        itemcount: images.length,
        itembuilder: (BuildContext context, int index) =>
            Image.network(images[index]),
        onEnd: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}
