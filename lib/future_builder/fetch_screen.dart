import 'package:change_language/helpers/api_base_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FetchScreen extends StatefulWidget {
  const FetchScreen({Key? key}) : super(key: key);

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  final _api = ApiBaseHelper();

  Future<String> fetch() async {
    // final a = RegExp('/^');
    String result = '';
    // try {
    await _api
        .onNetworkRequesting(
      url: 'https://jsonplaceholder.typicode.com/posts',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((value) {
      result = value.toString();
    });

    // } catch (_) {
    //   debugPrint('Work $_');
    // }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.put(FetchController()).update(['api']);
          setState(() {});
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<FetchController>(
                id: 'api',
                init: FetchController(),
                builder: (con) {
                  debugPrint('Getx Built');
                  return FutureBuilder(
                    future: fetch(),
                    builder: (_, AsyncSnapshot<String> snapshot) {
                      return Text('data ${snapshot.data}');
                    },
                  );
                },
              ),
              // FutureWidget(
              //   future: fetch(),
              //   onWaiting: () => const Text('waiting'),
              //   onDone: () => const Text('done'),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class FetchController extends GetxController {}
