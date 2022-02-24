import 'package:flutter/material.dart';

import 'package:magazine_v1/widget/image_card.dart';
import 'package:magazine_v1/widget/price_card.dart';
import 'package:magazine_v1/widget/title_date_rate_card.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    required this.title,
    required this.imageUrl,
    required this.date,
    required this.rate,
    required this.price,
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  final String title;
  final String imageUrl;
  final String date;
  final String rate;
  final String price;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ImageCard(imageUrl: imageUrl),
          TitleDateRateCard(title: title, date: date, rate: rate),
          PriceCard(price: price, onPressed: onPressed),
        ],
      ),
    );
  }
}
