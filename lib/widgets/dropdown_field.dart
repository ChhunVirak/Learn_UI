import 'package:flutter/material.dart';

class DropDownField extends StatefulWidget {
  final String? hintText;
  const DropDownField({super.key, this.hintText});

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  final _globalKey = GlobalKey();

  void _show(double h) {
    RenderBox renderBox =
        _globalKey.currentContext!.findRenderObject() as RenderBox;

    Offset offset = renderBox.localToGlobal(Offset.zero);
    OverlayState? overlayState;
    OverlayEntry? overlay;
    overlay = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                overlay?.remove();
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            left: offset.dx + 20,
            top: _showBottom(h)
                ? offset.dy + renderBox.size.height
                : offset.dy - height - 20,
            child: Material(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 0),
                      blurRadius: 4,
                      spreadRadius: -1,
                    ),
                  ],
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: const [
                    ListTile(
                      title: Text('Hello'),
                    ),
                    ListTile(
                      title: Text('Hello'),
                    ),
                    ListTile(
                      title: Text('Hello'),
                    ),
                    ListTile(
                      title: Text('Hello'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    overlayState = Overlay.of(context, rootOverlay: true);
    overlayState.insert(overlay);
    // overlayState.
  }

  final height = 200;
  _showBottom(double screenHeight) {
    RenderBox renderBox =
        _globalKey.currentContext!.findRenderObject() as RenderBox;

    double dy = renderBox.localToGlobal(Offset.zero).dy;
    if (dy + height < screenHeight) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final hei = MediaQuery.of(context).size.height;
    return GestureDetector(
      key: _globalKey,
      onTap: () {
        _show(hei);
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
                  widget.hintText ?? 'Selected',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                const Icon(Icons.expand),
              ],
            ),
          ),
          // widget.hintText != null
          //     ? Positioned(
          //         left: 30,
          //         top: -10,
          //         child: Container(
          //           padding:
          //               const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          //           color: Colors.white,
          //           child: Text(widget.hintText!),
          //         ),
          //       )
          //     : const SizedBox.shrink()
        ],
      ),
    );
  }
}
