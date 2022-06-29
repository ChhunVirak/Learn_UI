import 'package:change_language/modules/test/controllers/animecon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Anime extends StatelessWidget {
  const Anime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnimeController controller = Get.put(AnimeController());
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Obx(
              () => Transform.rotate(
                angle: controller.rotate.toDouble(),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: const [
                    Icon(
                      Icons.alarm,
                      size: 30,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 7,
                      child: Text(
                        '2',
                        style: TextStyle(fontSize: 10),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.animet();
        },
      ),
    );
  }
}
