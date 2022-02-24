import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:magazine_v1/data/dummy_data.dart';
import 'package:magazine_v1/utilities/hex_color.dart';
import 'package:magazine_v1/widget/banner.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f3f5f9'),
      body: DefaultTabController(
        length: 1,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search, color: HexColor('#2b2d3c'), size: 30),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.qr_code_2_outlined, color: HexColor('#2b2d3c'), size: 30),
                  ),
                ],
                title: Row(
                  children: [
                    const SizedBox(width: 15),
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/78025987?v=4'),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      'Hi Jesther',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: HexColor('#2b2d3c'),
                      ),
                    ),
                  ],
                ),
                expandedHeight: 550.0,
                elevation: 3,
                floating: false,
                pinned: true,
                backgroundColor: HexColor('#f3f5f9'),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 45),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 20),
                        child: Text(
                          'For You',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 35,
                            color: HexColor('#2b2d3c'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 350,
                        child: AnimationLimiter(
                          child: ListView.builder(
                            itemCount: DummyData.bannerData.length,
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return BannerHome(
                                title: DummyData.bannerData[index]['title'],
                                date: DummyData.bannerData[index]['date'],
                                imageUrl: DummyData.bannerData[index]['imageUrl'],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: TabBar(
                  labelColor: HexColor('#f3f5f9'),
                  indicatorColor: HexColor('#f3f5f9'),
                  unselectedLabelColor: Colors.pink,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  indicatorWeight: 1,
                  automaticIndicatorColorAdjustment: true,
                  tabs: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'お知らせ',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              color: HexColor('#000000'),
                            ),
                          ),
                          const SizedBox(width: 50),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: SafeArea(
            top: false,
            child: RefreshIndicator(
              color: HexColor('#DBF9FF'),
              backgroundColor: HexColor('#FF715B'),
              onRefresh: () => Future.delayed(const Duration(milliseconds: 100), () => debugPrint('Refreshing')),
              child: AnimationLimiter(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 0, bottom: 0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 0,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: FadeInAnimation(
                        child: SlideAnimation(
                          verticalOffset: 100,
                          child: const SizedBox(),
                          // child: MenuCard(
                          //   body: value.data[index]['news_description'],
                          //   title: value.data[index]['news_title'],
                          //   imageUrl: value.data[index]['news_image'] == '' ? MenuCard.dummyData[0]['imageUrl'] : value.data[index]['news_image'],
                          //   hexColor: value.data[index]['hex_value'],
                          //   categoryName: value.data[index]['category_name'],
                          //   data: MenuCard.dummyData[0],
                          // ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
