import 'package:flutter/material.dart';
import 'package:magazine_v1/utilities/hex_color.dart';
import 'package:magazine_v1/widget/custom_button.dart';

class MagazineBody extends StatelessWidget {
  const MagazineBody({
    required this.date,
    required this.rate,
    Key? key,
  }) : super(key: key);
  final String date;
  final String rate;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: 22,
                color: HexColor('#7f8791'),
              ),
            ),
            const SizedBox(height: 15),
            RichText(
              text: TextSpan(
                text: 'Rating: ',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  color: HexColor('#7f8791'),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: rate,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: ' / 10.0',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      color: HexColor('#7f8791'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(icon: Icons.share_outlined, onTap: () {}),
                CustomButton(icon: Icons.bookmark_outline, onTap: () {}),
                CustomButton(icon: Icons.star_border_rounded, isPressed: true, onTap: () {}),
              ],
            ),
            const SizedBox(height: 20),
            TabBar(
              labelColor: HexColor('#2b2d3c'),
              indicatorColor: HexColor('#818993'),
              unselectedLabelColor: HexColor('#818993'),
              isScrollable: true,
              labelPadding: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(0),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 1,
              automaticIndicatorColorAdjustment: true,
              labelStyle: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: 18,
                color: HexColor('#2b2d3c'),
              ),
              tabs: [
                Container(
                  width: MediaQuery.of(context).size.width * .40,
                  height: 55,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.read_more_sharp),
                        SizedBox(width: 5),
                        Text('Description'),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .40,
                  height: 55,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.chat_outlined),
                        SizedBox(width: 5),
                        Text('Reviews'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.transparent,
              height: 450,
              child: const TabBarView(
                children: [
                  Icon(Icons.directions_car),
                  Icon(Icons.directions_transit),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
