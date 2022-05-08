import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String? imgUrl;
  final String? title;
  final String? price;
  final GestureTapCallback? onTap;

  const CustomCard({
    Key? key,
    this.imgUrl,
    this.price,
    this.title,
    this.onTap,
  }) : super(key: key);

  Widget priceLabel(BuildContext context, String price) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.blue[100], borderRadius: BorderRadius.circular(10)),
      child: Text(
        price,
        style:
            Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.blue),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imgUrl!),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title ?? "No Title",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
        ),
        const SizedBox(height: 5),
        priceLabel(context, price ?? '\$0')
      ],
    );
  }
}
