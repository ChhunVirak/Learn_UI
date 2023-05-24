import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/dashboard/models/item_model.dart';

class DashBoardItem extends StatelessWidget {
  final ItemModel? itemModel;

  final GestureTapCallback? onTap;

  const DashBoardItem({
    Key? key,
    this.itemModel,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        padding: const EdgeInsets.fromLTRB(0, 20, 10, 20),
        decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.grey[900] : Colors.white,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: Colors.teal, width: 2),
          boxShadow: [
            BoxShadow(
              color: Get.isDarkMode ? Colors.black : Colors.black12,
              spreadRadius: 0.1,
              blurRadius: 4,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            AnimatedContainer(
              height: 20,
              decoration: BoxDecoration(
                color: itemModel?.sheetColor ?? Colors.transparent,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              width: 5,
              margin: const EdgeInsets.only(right: 10),
              duration: const Duration(milliseconds: 200),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemModel?.title ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    itemModel?.date ?? '- - -',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w200),
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
                      text: '${(itemModel!.progress! * 100).round()}',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontWeight: FontWeight.w300),
                      children: [
                        TextSpan(
                          text: '%',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(fontWeight: FontWeight.w300),
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
                        value: itemModel?.progress ?? 0,
                      ),
                    ),
                  ),
                  Text(
                    'Progress',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontWeight: FontWeight.w300),
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
