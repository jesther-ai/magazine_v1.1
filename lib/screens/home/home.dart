import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:magazine_v1/data/dummy_data.dart';
import 'package:magazine_v1/providers/dummy_loading.dart';
import 'package:magazine_v1/screens/home/tab_one.dart';
import 'package:magazine_v1/screens/home/tab_three.dart';
import 'package:magazine_v1/screens/home/tab_two.dart';
import 'package:magazine_v1/utilities/hex_color.dart';
import 'package:magazine_v1/widget/banner.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    initState(context);
    return Scaffold(
      backgroundColor: HexColor('#f3f5f9'),
      body: DefaultTabController(
        length: 3,
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
                      radius: 25,
                      backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/78025987?v=4'),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      'Hi Jesther Silvestre',
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
                      Consumer<DummyLoading>(
                        builder: (context, value, child) {
                          return value.isLoaded
                              ? SizedBox(
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
                                          onPressed: () => print(DummyData.bannerData[index]),
                                        );
                                      },
                                    ),
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
                    ],
                  ),
                ),
                bottom: TabBar(
                  labelColor: HexColor('#2b2d3c'),
                  indicatorColor: HexColor('#818993'),
                  unselectedLabelColor: HexColor('#818993'),
                  isScrollable: true,
                  labelPadding: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 1,
                  automaticIndicatorColorAdjustment: true,
                  labelStyle: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: HexColor('#2b2d3c'),
                  ),
                  tabs: [
                    Container(
                      width: MediaQuery.of(context).size.width * .30,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                      child: const Center(
                        child: Text(
                          'Newest',
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .30,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                      child: const Center(
                        child: Text(
                          'Popular',
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .30,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                      child: const Center(
                        child: Text(
                          'Featured',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              Tab1(),
              Tab2(),
              Tab3(),
            ],
          ),
        ),
      ),
    );
  }

  initState(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      DummyLoading dummyLoad = Provider.of<DummyLoading>(context, listen: false);
      if (!dummyLoad.isLoaded) dummyLoad.onRefresh();
    });
  }
}
