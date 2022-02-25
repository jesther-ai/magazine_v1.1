import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:magazine_v1/data/dummy_data.dart';
import 'package:magazine_v1/providers/dummy_loading.dart';
import 'package:magazine_v1/utilities/hex_color.dart';
import 'package:magazine_v1/widget/menu_card.dart';
import 'package:provider/provider.dart';

class Tab1 extends StatelessWidget {
  const Tab1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DummyData.random1();
    return SafeArea(
      top: false,
      child: RefreshIndicator(
        color: HexColor('#2c2e3d'),
        backgroundColor: Colors.yellow,
        onRefresh: () => Future.delayed(const Duration(milliseconds: 100), () => onRefresh(context)),
        child: Consumer<DummyLoading>(
          builder: (context, value, child) {
            return value.isLoaded
                ? AnimationLimiter(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 10, bottom: 0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: DummyData.listRandom1.length,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: FadeInAnimation(
                            child: SlideAnimation(
                              verticalOffset: 100,
                              child: MenuCard(
                                title: DummyData.listRandom1[index]['title'],
                                date: DummyData.listRandom1[index]['date'],
                                price: DummyData.listRandom1[index]['price'],
                                imageUrl: DummyData.listRandom1[index]['imageUrl'],
                                rate: DummyData.listRandom1[index]['rate'],
                                onPressed: () {},
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : SizedBox(
                    width: double.infinity,
                    height: 350,
                    child: Center(
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          color: HexColor('#2b2d3c'),
                          strokeWidth: 2.5,
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }

  onRefresh(context) {
    DummyLoading dummyLoad = Provider.of<DummyLoading>(context, listen: false);
    dummyLoad.onRefresh();
  }
}
