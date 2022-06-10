import 'package:change_language/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:change_language/widgets/dashboard/dashboard_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(DashBoardController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Screens'),
      ),
      body: SafeArea(
        child: Obx(
          () => ListView(
            padding: const EdgeInsets.only(top: 20),
            children: _con.itemList
                .asMap()
                .entries
                .map(
                  (e) => DashBoardItem(
                    selected: e.key == _con.currentItem.value,
                    value: e.value.progress,
                    sheetColor: e.value.sheetColor,
                    text: e.value.title,
                    date: e.value.date,
                    onTap: () {
                      _con.currentItem(e.key);
                      _con.itemList.refresh();
                      Future.delayed(const Duration(milliseconds: 500), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => e.value.item!,
                          ),
                        );
                      });
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
