import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/cv_component.dart';
import '../controler/cv_controller.dart';

class CVPage extends StatefulWidget {
  const CVPage({Key? key}) : super(key: key);

  @override
  State<CVPage> createState() => _CVPageState();
}

class _CVPageState extends State<CVPage> {
  final key = GlobalKey();

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
              _controller.captureAndSave(key);
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
                    fontSize: 16,
                  ),
                  headline6: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
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
                    key: key,
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
                              const SizedBox(height: 5),
                              const TextContent(
                                name: 'Address',
                                data: '',
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
                              const CVDivider(),
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
                              const TitleText('EDUCATION BACKGROUND'),
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
                              const TitleText('TRAINING COURSES'),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 20,
                          child: Container(
                            width: 50,
                            decoration: const BoxDecoration(
                                // border: Border.all(
                                //   color: Colors.black,
                                // ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://i.pinimg.com/originals/3a/82/b4/3a82b40cfaaf7ae99f8d2f2faaab277e.png'))),
                            child: const AspectRatio(
                              aspectRatio: 4 / 5,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Paper(
                    child: Text(''),
                  )
                ],
              ),
            );
          }),
    );
  }
}
