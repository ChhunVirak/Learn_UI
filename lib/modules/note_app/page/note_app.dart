import 'package:flutter/material.dart';

class NoteApp extends StatefulWidget {
  const NoteApp({super.key});

  @override
  State<NoteApp> createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (dialogContext) => Center(
                child: Material(
                  child: TextField(
                    autofocus: true,
                    onSubmitted: (value) {},
                  ),
                ),
              ),
            );
          },
          child: Container(
            width: double.maxFinite,
            color: Colors.transparent,
            child: const Column(
              mainAxisSize: MainAxisSize.max,
              children: [Text('data')],
            ),
          ),
        ),
      ),
    );
  }
}
