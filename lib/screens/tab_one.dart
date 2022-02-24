import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:magazine_v1/data/dummy_data.dart';
import 'package:magazine_v1/utilities/hex_color.dart';
import 'package:magazine_v1/widget/menu_card.dart';

class Tab1 extends StatelessWidget {
  const Tab1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: RefreshIndicator(
        color: HexColor('#2c2e3d'),
        backgroundColor: Colors.yellow,
        onRefresh: () => Future.delayed(const Duration(milliseconds: 100), () => debugPrint('Refreshing')),
        child: AnimationLimiter(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 10, bottom: 0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: DummyData.listData.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 500),
                child: FadeInAnimation(
                  child: SlideAnimation(
                    verticalOffset: 100,
                    child: MenuCard(
                      title: DummyData.listData[index]['title'],
                      date: DummyData.listData[index]['date'],
                      price: DummyData.listData[index]['price'],
                      imageUrl: DummyData.listData[index]['imageUrl'],
                      rate: DummyData.listData[index]['rate'],
                      onPressed: () {},
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
