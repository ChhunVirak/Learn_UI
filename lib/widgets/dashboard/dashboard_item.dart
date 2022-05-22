import 'package:flutter/material.dart';

class DashBoardItem extends StatelessWidget {
  final String? text;
  final String? date;
  final double? value;
  final Color? sheetColor;
  final GestureTapCallback? onTap;
  const DashBoardItem({
    Key? key,
    this.text,
    this.onTap,
    this.date,
    this.sheetColor,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        padding: const EdgeInsets.fromLTRB(0, 20, 10, 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: Colors.teal, width: 2),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 0.1,
              blurRadius: 4,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 30,
              decoration: BoxDecoration(
                color: sheetColor ?? Colors.transparent,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              width: 5,
              margin: const EdgeInsets.only(right: 10),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 15),
                  ),
                  Text(
                    date ?? '- - -',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: '20',
                      children: [
                        TextSpan(
                          text: '%',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: value ?? 0,
                      ),
                    ),
                  ),
                  Text(
                    'Progress',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
