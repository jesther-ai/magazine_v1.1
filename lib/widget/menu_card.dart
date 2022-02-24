import 'package:flutter/material.dart';
import 'package:magazine_v1/data/dummy_data.dart';
import 'package:magazine_v1/widget/image_card.dart';
import 'package:magazine_v1/widget/price_card.dart';
import 'package:magazine_v1/widget/title_date_rate_card.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({Key? key}) : super(key: key);

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
          ImageCard(imageUrl: DummyData.bannerData[1]['imageUrl']),
          const TitleDateRateCard(title: 'Shinning Flowers', date: '10 Dec 2021', rate: '3.8'),
          PriceCard(price: '\$11.00', onPressed: () {}),
        ],
      ),
    );
  }
}
