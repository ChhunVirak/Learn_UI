import 'dart:convert';

import 'package:change_language/modules/test/screens/user_model.dart';
import 'package:change_language/widgets/enhance_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestdropDown extends StatefulWidget {
  const TestdropDown({Key? key}) : super(key: key);

  @override
  State<TestdropDown> createState() => _TestdropDownState();
}

List<UserModel> listUser = [];

class _TestdropDownState extends State<TestdropDown> {
  Future<List<UserModel>> fetchData() async {
    try {
      Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users');
      await http.get(url).then((value) {
        listUser.clear();
        var responseJson = jsonDecode(value.body);
        responseJson.map((e) {
          debugPrint('1');
          listUser.add(
            UserModel.fromMap(e),
          );
        }).toList();
        setState(() {});

        debugPrint('Data : $listUser');
      });
    } catch (e) {
      debugPrint('Fetching Error $e');
    }
    return listUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          CupertinoIcons.home,
          color: Colors.black,
        ),
        title: const Text(
          'Drop Down',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            CupertinoIcons.home,
            color: Colors.black,
          ),
          SizedBox(width: 15)
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1.5,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: EnhancedDropDown(
              selectedmapper: (v) {
                var text = v as UserModel;
                return text.email.toString() + ' name';
              },
              hintText: 'Username',
              // initialText: 'Hello Guy',
              onChange: (index, dyna) {
                debugPrint('Index ======> $index');
                debugPrint('Dyna ======> $dyna');
              },

              dataSource: listUser,
              itemCount: listUser.length,
              itembuilder: (context, index, s) => ListTile(
                leading: const Icon(Icons.holiday_village),
                title: Text(
                  listUser[index].email!,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          EnhancedDropDown(
              dataSource: const [
                1,
                2,
                3,
              ],
              selectedmapper: (_) => '$_',
              hintText: 'hello',
              itembuilder: (_, __, ___) => const Text('data'),
              itemCount: 3),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            onPressed: () {
              fetchData();
            },
            child: const Text('Start Fetch'),
          )
        ],
      ),
    );
  }
}
