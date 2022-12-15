import 'package:change_language/helpers/api_base_helper.dart';
import 'package:flutter/material.dart';

import 'future_widget.dart';

class FetchScreen extends StatefulWidget {
  const FetchScreen({Key? key}) : super(key: key);

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  final _api = ApiBaseHelper();

  Future<String> fetch() async {
    String result = '';
    // try {
    await _api
        .onNetworkRequesting(
      url: 'https://jsonplaceholder.typicode.com/posts',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((value) {
      // debugPrint('Work $value');

      debugPrint('${value[0]['id']}');
    });
    // } catch (_) {
    //   debugPrint('Work $_');
    // }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FutureBuilder(
              future: fetch(),
              builder: (context, snapshot) => const Text('data'),
            ),
          ),
          FutureWidget(
            future: fetch(),
            onWaiting: () => const Text('waiting'),
            onDone: () => const Text('done'),
          )
        ],
      ),
    );
  }
}
