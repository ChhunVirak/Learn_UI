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
    name: 'Chhoeung Chhun Virak',
    age: '20',
    gender: Gender.male.text,
    tel: '099663857',
    email: 'Chhunvirakchhoeung@gmail.com',
    position: 'Flutter Developer',
    maritalStatus: MaritalStatus.single.text,
    placeofbirth: Place(
      village: 'Ophot',
      commune: 'Angtason',
      district: 'Tramkak',
      province: 'Takeo',
      country: 'Cambodia',
    ),
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
  );

  Future<void> captureAndSave(GlobalKey key) async {
    try {
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 150);
      final byteData = await image.toByteData(format: ImageByteFormat.png);
      final pngBytes = byteData!.buffer.asUint8List();
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/pdf.png');
      await file.writeAsBytes(pngBytes);
      final result = await ImageGallerySaver.saveFile(file.path);
      debugPrint('Success $result');
    } catch (_) {
      debugPrint("$_");
      // ScaffoldMessenger.of(context)
    }
  }
}
