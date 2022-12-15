import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

import '../model/cv_core_model.dart';

class CvController extends GetxController {
  final cvdata = CvModel(
    name: 'Chhoeung SeavMey',
    age: '16',
    gender: Gender.male.text,
    tel: '099663857',
    email: 'Chhunvirakchhoeung@gmail.com',
    position: 'Flutter Developer',
    maritalStatus: MaritalStatus.single.text,
    address: Place(
      village: 'Ophot',
      commune: 'Angtason',
      district: 'Tramkak',
      province: 'Takeo',
      country: 'Cambodia',
    ),
    placeofbirth: Place(
      village: 'Urssey',
      commune: 'Meanchey',
      district: 'Meanchey',
      province: 'Phnom Penh',
      country: 'Cambodia',
    ),
    languages: [
      LangaugeData(
        lang: Languages.khmer,
        level: Level.native,
      ),
      LangaugeData(
        lang: Languages.english,
        level: Level.good,
      ),
      LangaugeData(
        lang: Languages.thai,
        level: Level.normal,
      ),
    ],
    educations: [
      YearData(
        start: '2019',
        end: '2020',
        data: 'Grade 12',
      ),
      YearData(
        start: '2020',
        end: 'Now',
        data: 'Information Technology at RUPP',
      ),
    ],
    hobbys: [
      'Music',
      'Coding',
      'Reading',
    ],
    references: [
      Reference(
        name: 'Khin Chandara',
        phone: '092595685',
        position: 'Accountant',
      )
    ],
  );

  final processing = 0.0.obs;

  Future<void> onSaveAll(
    List<GlobalKey> keys,
  ) async {
    int done = 0;
    for (var i in keys) {
      await captureAndSave(i);
      done += 1;
      processing.value = done / 2;
    }
  }

  Future<void> captureAndSave(GlobalKey key) async {
    try {
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 150);
      debugPrint('Success 1');
      final byteData = await image.toByteData(format: ImageByteFormat.png);
      debugPrint('Success 2');
      final pngBytes = byteData!.buffer.asUint8List();
      debugPrint('Success 3');
      final directory = await getTemporaryDirectory();
      debugPrint('Success 4');
      final file = File('${directory.path}/pdf.png');
      debugPrint('Success 5');
      await file.writeAsBytes(pngBytes);
      final result = await ImageGallerySaver.saveFile(file.path);
      debugPrint('Success $result');
    } catch (_) {
      debugPrint("$_");
      // ScaffoldMessenger.of(context)
    }
  }
}
