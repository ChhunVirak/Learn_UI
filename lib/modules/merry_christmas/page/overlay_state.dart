import 'package:flutter/material.dart';

class AppOverLay extends StatefulWidget {
  @override
  State<AppOverLay> createState() => _AppOverLayState();
}

class _AppOverLayState extends State<AppOverLay> {
  OverlayEntry? _overlayEntry;

  final menu = [
    'Accounts',
    'Cards',
    'Payments',
    'New Account',
    'Cash to ATM',
    'Transfers',
    'Scan QR',
    'Loans',
    'Services'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('ABA'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 1.11,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
            ),
            itemCount: menu.length,
            itemBuilder: (_, index) => Container(
              // color: Colors.red,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    menu[index],
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 50),
              width: double.infinity,
              color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Quick Transfer',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Create your templates have to make transfer quicker',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              color: Colors.red[400],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Quick Payment',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Paying your bills with template is faster',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
