import 'package:flutter/material.dart';
import 'package:magazine_v1/utilities/hex_color.dart';

class TitleDateRateCard extends StatelessWidget {
  const TitleDateRateCard({
    required this.title,
    required this.date,
    required this.rate,
    Key? key,
  }) : super(key: key);
  final String title;
  final String date;
  final String rate;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 18,
            color: HexColor('#2b2d3c'),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          date,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 15,
            color: HexColor('#818993'),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Icon(
              Icons.star,
              color: HexColor('#fdce36'),
            ),
            const SizedBox(width: 5),
            Text(
              rate,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: 18,
                color: HexColor('#2b2d3c'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
