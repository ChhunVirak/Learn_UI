import 'package:change_language/helpers/local_storage.dart';
import 'package:change_language/modules/merry_christmas/controller/animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/test_phone/test_phone.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.instance.init();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        // textTheme: const TextTheme(
        //   headline4: TextStyle(
        //     color: Colors.black,
        //     fontWeight: FontWeight.bold,
        //     fontSize: 16,
        //   ),
        //   headline6: TextStyle(
        //     color: Colors.black,
        //     fontWeight: FontWeight.w600,
        //     fontSize: 14,
        //   ),
        //   subtitle2: TextStyle(
        //     color: Colors.black,
        //     fontWeight: FontWeight.w400,
        //     fontSize: 12,
        //   ),
        // ),
      ),
      initialBinding: AppBinding(),
      home: const TestPhone(),
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MyAnimationController());
  }
}
