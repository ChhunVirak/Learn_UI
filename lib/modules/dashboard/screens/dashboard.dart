import 'package:change_language/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:change_language/widgets/dashboard/dashboard_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(DashBoardController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 1,
        title: const Text('Flutter'),
        titleTextStyle: TextStyle(
            color: Get.isDarkMode ? Colors.grey[100] : Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.apps_rounded,
              // color: Colors.black,
            ),
          ),
        ),
        actions: [
          Obx(
            () => Transform.scale(
              scale: 0.8,
              child: CupertinoSwitch(
                activeColor: Colors.grey[900],
                trackColor: Colors.grey[200],
                thumbColor: Colors.red,
                value: _con.isnightMode.value,
                onChanged: (v) {
                  _con.isnightMode(v);
                  if (_con.isnightMode.value) {
                    Get.changeTheme(ThemeData.dark());
                  } else {
                    Get.changeTheme(ThemeData.light());
                  }
                },
              ),
            ),
          ),
          const SizedBox(width: 10)
        ],
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
                      Future.delayed(
                        const Duration(milliseconds: 500),
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => e.value.item!,
                            ),
                          );
                        },
                      );
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
