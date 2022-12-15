import 'package:flutter/material.dart';

class Anime extends StatefulWidget {
  const Anime({Key? key}) : super(key: key);

  @override
  State<Anime> createState() => _AnimeState();
}

class _AnimeState extends State<Anime> {
  // ScrollController? _scrollController;

  final months = [
    'Jan',
    'Feb',
    'March',
    'April',
    'May',
    'June',
    'July',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  int selectedIndex = 0;

  bool getYPositioned(GlobalKey? key) {
    RenderObject? renderBox = key?.currentContext?.findRenderObject();
    return renderBox != null;
  }

  GlobalKey<State<StatefulWidget>>? get key =>
      datas.firstWhere((e) => e.text == 'May').key;
  GlobalKey<State<StatefulWidget>>? get key1 =>
      datas.firstWhere((e) => e.text == 'June').key;
  GlobalKey<State<StatefulWidget>>? get key2 =>
      datas.firstWhere((e) => e.text == 'July').key;
  GlobalKey<State<StatefulWidget>>? get key3 =>
      datas.firstWhere((e) => e.text == 'August').key;
  GlobalKey<State<StatefulWidget>>? get key4 =>
      datas.firstWhere((e) => e.text == 'September').key;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              // scrollDirection: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: months
                  .asMap()
                  .entries
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = e.key;
                        });
                      },
                      child: Text(
                        e.value,
                        style: TextStyle(
                          color: selectedIndex == e.key ? Colors.red : null,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Expanded(
                child: NotificationListener(
              onNotification: (ScrollEndNotification v) {
                // double maxScrollExtent = v.metrics.maxScrollExtent;
                try {
                  if (getYPositioned(key)) {
                    selectedIndex = 0;
                    setState(() {});
                    debugPrint('Here');
                  }
                  if (getYPositioned(key1)) {
                    selectedIndex = 1;
                    setState(() {});
                    debugPrint('Here');
                  }
                  if (getYPositioned(key2)) {
                    selectedIndex = 2;
                    setState(() {});
                    debugPrint('Here');
                  }
                  if (getYPositioned(key3)) {
                    selectedIndex = 3;
                    setState(() {});
                    debugPrint('Here');
                  }
                } catch (_) {}
                return false;
              },
              child: ListView(
                children: datas.asMap().entries.map((e) {
                  return ListTile(
                    key: datas[e.key].key = GlobalKey(),
                    title: Text(e.value.text!),
                  );
                }).toList(),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

List<Data> datas = <Data>[
  Data(text: 'Jan'),
  Data(text: 'Jan'),
  Data(text: 'Jan'),
  Data(text: 'Jan'),
  Data(text: 'Jan'),
  Data(text: 'Jan'),
  Data(text: 'Feb'),
  Data(text: 'Feb'),
  Data(text: 'Feb'),
  Data(text: 'Feb'),
  Data(text: 'Feb'),
  Data(text: 'Feb'),
  Data(text: 'Feb'),
  Data(text: 'March'),
  Data(text: 'March'),
  Data(text: 'March'),
  Data(text: 'March'),
  Data(text: 'March'),
  Data(text: 'March'),
  Data(text: 'March'),
  Data(text: 'April'),
  Data(text: 'April'),
  Data(text: 'April'),
  Data(text: 'April'),
  Data(text: 'April'),
  Data(text: 'April'),
  Data(text: 'April'),
  Data(text: 'April'),
  Data(text: 'May'),
  Data(text: 'May'),
  Data(text: 'May'),
  Data(text: 'May'),
  Data(text: 'May'),
  Data(text: 'May'),
  Data(text: 'May'),
  Data(text: 'May'),
  Data(text: 'June'),
  Data(text: 'June'),
  Data(text: 'June'),
  Data(text: 'June'),
  Data(text: 'June'),
  Data(text: 'June'),
  Data(text: 'June'),
  Data(text: 'June'),
  Data(text: 'June'),
  Data(text: 'July'),
  Data(text: 'July'),
  Data(text: 'July'),
  Data(text: 'July'),
  Data(text: 'July'),
  Data(text: 'July'),
  Data(text: 'July'),
  Data(text: 'July'),
  Data(text: 'July'),
  Data(text: 'August'),
  Data(text: 'August'),
  Data(text: 'August'),
  Data(text: 'August'),
  Data(text: 'August'),
  Data(text: 'August'),
  Data(text: 'August'),
  Data(text: 'August'),
  Data(text: 'September'),
  Data(text: 'September'),
  Data(text: 'September'),
  Data(text: 'September'),
  Data(text: 'September'),
  Data(text: 'September'),
  Data(text: 'September'),
  Data(text: 'September'),
  Data(text: 'September'),
  Data(text: 'October'),
  Data(text: 'October'),
  Data(text: 'October'),
  Data(text: 'October'),
  Data(text: 'October'),
  Data(text: 'October'),
  Data(text: 'October'),
  Data(text: 'October'),
  Data(text: 'October'),
  Data(text: 'October'),
  Data(text: 'November'),
  Data(text: 'November'),
  Data(text: 'November'),
  Data(text: 'November'),
  Data(text: 'November'),
  Data(text: 'November'),
  Data(text: 'November'),
  Data(text: 'November'),
  Data(text: 'November'),
  Data(text: 'December'),
  Data(text: 'December'),
  Data(text: 'December'),
  Data(text: 'December'),
  Data(text: 'December'),
  Data(text: 'December'),
  Data(text: 'December'),
  Data(text: 'December'),
  Data(text: 'December'),
  Data(text: 'December'),
];

class Data {
  GlobalKey? key;
  final String? text;
  Data({
    this.key,
    required this.text,
  });
}
