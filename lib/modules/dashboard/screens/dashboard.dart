import 'package:change_language/modules/dashboard/models/item_model.dart';
import 'package:change_language/widgets/dashboard/dashboard_item.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Screens'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(top: 20),
          children: itemList
              .asMap()
              .entries
              .map(
                (e) => DashBoardItem(
                  value: e.value.progress,
                  sheetColor: e.value.sheetColor,
                  text: e.value.title,
                  date: e.value.date,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => e.value.item!,
                      ),
                    );
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
