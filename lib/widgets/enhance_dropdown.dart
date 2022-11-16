import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnhancedDropDown extends StatefulWidget {
  final String? initialText;
  final String? hintText;
  final String Function(dynamic)? selectedmapper;
  final List<dynamic> dataSource;

  ///This will generate number
  final int? itemCount;
  final Widget Function(BuildContext context, int index, dynamic model)?
      itembuilder;
  final void Function(int index, dynamic itemModel)? onChange;

  const EnhancedDropDown({
    Key? key,
    this.initialText,
    required this.dataSource,
    required this.itembuilder,
    required this.itemCount,  
    this.onChange,
    this.hintText,
    this.selectedmapper,
  }) : super(key: key);

  @override
  State<EnhancedDropDown> createState() => _EnhancedDropDownState();
}

class _EnhancedDropDownState extends State<EnhancedDropDown> {
  String selectedText = '';
  bool showHintText = false;

  Widget _hintText() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      color: Colors.grey[100],
      child: Text(widget.hintText ?? ''),
    );
  }

  void _handdleSelection(String text, int index, {bool pop = true}) {
    widget.onChange != null ? widget.onChange!(index, text) : null;
    selectedText = widget.selectedmapper != null
        ? widget.selectedmapper!(widget.dataSource[index])
        : '';
    setState(() {});
    pop ? Navigator.pop(context) : null;
  }

  void _handdlehintText() {
    if (selectedText.isNotEmpty) {
      showHintText = false;
    } else {
      showHintText = true;
    }
    setState(() {});
  }

  Widget _dateTimerPicker() {
    return CupertinoDatePicker(
      onDateTimeChanged: (value) {
        debugPrint('Value = $value');
        // selectedText = value.toString();
        _handdleSelection('$value', 1, pop: false);
        // _handdlehintText();
      },
    );
  }

  @override
  void initState() {
    selectedText = widget.initialText ?? '';
    _handdlehintText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
          // constraints: BoxConstraints(
          //     maxHeight: MediaQuery.of(context).size.height * 0.5),
          context: context,
          builder: (context) => ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Material(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.red[700],
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Enhanced Dropdown',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      child: 1 == 2
                          ? _dateTimerPicker()
                          : ListView.separated(
                              padding: const EdgeInsets.only(top: 5),
                              itemCount: widget.itemCount ?? 0,
                              separatorBuilder: (_, __) => const Divider(),
                              itemBuilder: (BuildContext _, int __) {
                                return GestureDetector(
                                  onTap: () {
                                    _handdleSelection('Selected item $__', __);
                                    _handdlehintText();
                                  },
                                  child: widget.itembuilder!(context, __, __),
                                );
                              },
                              //     ListTile(
                              //   onTap: () {
                              //     _handdleSelection('Selected $index');
                              //   },
                              //   title: Text(
                              //     'This is title by $index',
                              //     style: const TextStyle(color: Colors.black),
                              //   ),
                              // ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black26),
            ),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(
                  showHintText ? widget.hintText ?? '' : selectedText,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                const Icon(Icons.expand),
              ],
            ),
          ),
          !showHintText
              ? Positioned(left: 30, top: -8, child: _hintText())
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
