import 'package:change_language/constant/app_constant.dart';
import 'package:flutter/material.dart';

class RealEstate extends StatefulWidget {
  //name = 'virak';

  const RealEstate({Key? key}) : super(key: key);

  @override
  State<RealEstate> createState() => _RealEstateState();
}

class _RealEstateState extends State<RealEstate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'បញ្ជីលក់',
          style: TextStyle(color: textColor),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: chipList
                  .asMap()
                  .entries
                  .map(
                    (e) => buildChip(
                        text: e.value,
                        onTap: () {
                          selectedIndex = e.key;
                          setState(() {});
                        },
                        selected: selectedIndex == e.key),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.only(top: 20),
                itemBuilder: (_, index) {
                  return propertyCard(type: index.isEven ? 'rejected' : '');
                },
                separatorBuilder: (_, __) {
                  return const SizedBox(height: 20);
                },
                itemCount: 50),
          )
        ],
      ),
    );
  }

  Container propertyCard({String? type}) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(color: Colors.blue[100]),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(defaultRadius)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text('A0'),
                    Spacer(),
                    Text('\$50.000'),
                  ],
                ),
                Row(
                  children: [
                    const Text('05 05 2002'),
                    const Spacer(),
                    Text(
                      'Approved',
                      style: TextStyle(
                        color: setColor(type!),
                      ),
                    ),
                  ],
                ),
                const Text('Phnom Penh, Cambodia'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Color setColor(String type) {
    switch (type.toLowerCase()) {
      case 'pending':
        return Colors.blue;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.green;
    }
  }

  int selectedIndex = 0;

  List<String> chipList = <String>[
    'All',
    'Pending',
    'Approved',
    'Rejected',
    'Something'
  ];

  Widget buildChip(
      {required String? text, VoidCallback? onTap, bool selected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Chip(
          label: Text(text!),
          backgroundColor: selected ? Colors.orange[100] : Colors.black12,
        ),
      ),
    );
  }
}
