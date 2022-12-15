import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/cv_component.dart';
import '../controller/cv_controller.dart';

class CVPage extends StatefulWidget {
  const CVPage({Key? key}) : super(key: key);

  @override
  State<CVPage> createState() => _CVPageState();
}

class _CVPageState extends State<CVPage> {
  final page1 = GlobalKey();
  final page2 = GlobalKey();

  final _controller = Get.put(CvController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('CV Maker'),
        actions: [
          IconButton(
            onPressed: () {
              // _controller.onSaveAll(
              //   [page1, page2],
              // );
              showDialog(
                // barrierDismissible: false,
                context: context,
                builder: (context) => Center(
                  child: Obx(
                    () => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(20),
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const BodyText('Procesing . . .'),
                          LinearProgressIndicator(
                            value: _controller.processing.value,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.file_download_rounded),
          )
        ],
      ),
      body: GetBuilder<CvController>(
          init: CvController(),
          builder: (_) {
            return Theme(
              data: ThemeData(
                primarySwatch: Colors.red,
                textTheme: const TextTheme(
                  headline4: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                  headline6: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                  subtitle2: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 20),
                children: [
                  RepaintBoundary(
                    key: page1,
                    child: Stack(
                      children: [
                        Paper(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(
                                child: HeaderText('CURRICULUM VITAE\n'),
                              ),
                              TitleText(_.cvdata.name),
                              TextContent(
                                name: 'Name',
                                data: _.cvdata.name,
                              ),
                              TextContent(
                                name: 'Address',
                                data: _.cvdata.address?.location,
                              ),
                              TextContent(
                                name: 'Tel',
                                data: _.cvdata.tel,
                              ),
                              TextContent(
                                name: 'Email',
                                data: _.cvdata.email,
                              ),
                              TextContent(
                                name: 'Apply for',
                                data: _.cvdata.position,
                              ),
                              const TitleText('PERSONAL INFORMATION'),
                              TextContent(
                                name: 'Nationality',
                                data: _.cvdata.nationality,
                              ),
                              TextContent(
                                name: 'Sex',
                                data: _.cvdata.gender,
                              ),
                              TextContent(
                                name: 'Marital Status',
                                data: _.cvdata.maritalStatus,
                              ),
                              TextContent(
                                name: 'Date of Birth',
                                data: _.cvdata.gender,
                              ),
                              TextContent(
                                name: 'Place of Birth',
                                data: _.cvdata.placeofbirth?.location,
                              ),
                              const TitleText('EDUCATION'),
                              Column(
                                children: _.cvdata.educations!
                                    .map(
                                      (e) => TextContent(
                                        name: e.yearToyear,
                                        data: e.data,
                                      ),
                                    )
                                    .toList(),
                              ),
                              const TitleText('LANGUAGE'),
                              Column(
                                children: _.cvdata.languages!
                                    .map(
                                      (e) => TextContent(
                                        name: e.getlanguage,
                                        data: e.getlevel,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 60,
                          right: 30,
                          child: Container(
                            width: 50,
                            decoration: const BoxDecoration(),
                            // border: Border.all(
                            //   color: Colors.black,
                            // ),
                            // image: DecorationImage(
                            //     fit: BoxFit.cover,
                            //     image: NetworkImage(
                            //         'https://i.pinimg.com/originals/3a/82/b4/3a82b40cfaaf7ae99f8d2f2faaab277e.png'))),
                            child: const AspectRatio(
                              aspectRatio: 4 / 5,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  RepaintBoundary(
                    key: page2,
                    child: Paper(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TitleText('HOBBIES'),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _.cvdata.hobbys!
                                .map(
                                  (e) => BodyText(e),
                                )
                                .toList(),
                          ),
                          const TitleText('REFERENCE'),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _.cvdata.references!
                                .map(
                                  (e) => Column(
                                    children: [
                                      TextContent(
                                        name: 'Name',
                                        data: e.name,
                                      ),
                                      TextContent(
                                        name: 'Tel',
                                        data: e.getPhoneFormat,
                                      ),
                                      TextContent(
                                        name: 'Position',
                                        data: e.position,
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
