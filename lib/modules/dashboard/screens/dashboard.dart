import 'package:change_language/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:change_language/widgets/dashboard/dashboard_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final con = Get.put(DashBoardController());

  bool isDrawerOpenned = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SafeArea(
                child: Column(
              children: [
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.home_rounded),
                  title: const Text('Home'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.settings_rounded),
                  title: const Text('Setting'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.contact_support_rounded),
                  title: const Text('Contact'),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text('Privacy'),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text('About'),
                ),
                const Spacer(),
                const ListTile(
                  title: Text('Copyright by Virak'),
                ),
              ],
            )),
          ),
          AnimatedPositioned(

              // top: MediaQuery.of(context).size.width / 1.5,
              left:
                  isDrawerOpenned ? MediaQuery.of(context).size.width * 0.6 : 0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              child: GestureDetector(
                onTap: () {
                  isDrawerOpenned = false;
                  setState(() {});
                  debugPrint('Success Apr');
                },
                child: AnimatedScale(
                  scale: isDrawerOpenned ? 0.8 : 1,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.fastOutSlowIn,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius:
                            isDrawerOpenned ? BorderRadius.circular(20) : null),
                    child: IgnorePointer(
                      ignoring: isDrawerOpenned,
                      child: Scaffold(
                        appBar: AppBar(
                          leading: IconButton(
                            onPressed: () {
                              isDrawerOpenned = true;
                              setState(() {});
                            },
                            icon: const Icon(Icons.view_list),
                          ),
                          centerTitle: false,
                          elevation: 1,
                          title: const Text('Flutter'),
                          // titleTextStyle: TextStyle(
                          //     color: Get.isDarkMode ? Colors.grey[100] : Colors.black,
                          //     fontWeight: FontWeight.w500,
                          //     fontSize: 20),
                          // backgroundColor: Theme.of(context).scaffoldBackgroundColor,

                          actions: [
                            IconButton(
                              onPressed: () {
                                Get.changeThemeMode(Get.isDarkMode
                                    ? ThemeMode.light
                                    : ThemeMode.dark);
                                setState(() {});
                                debugPrint('Success ${Get.isDarkMode}');
                              },
                              icon: Icon(Get.isDarkMode
                                  ? Icons.dark_mode
                                  : Icons.light_mode),
                            ),
                            const SizedBox(width: 10)
                          ],
                        ),
                        body: SafeArea(
                          child: Obx(
                            () => ListView(
                              padding: const EdgeInsets.only(top: 20),
                              children: con.itemList
                                  .asMap()
                                  .entries
                                  .map(
                                    (e) => DashBoardItem(
                                      itemModel: e.value,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => e.value.item!,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
