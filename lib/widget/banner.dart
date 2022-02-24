import 'package:flutter/material.dart';
import 'package:magazine_v1/utilities/hex_color.dart';

class BannerHome extends StatelessWidget {
  const BannerHome({
    required this.title,
    required this.date,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);
  final String title;
  final String date;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 220,
          height: 300,
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  color: HexColor('#2b2d3c'),
                ),
              ),
              Text(
                date,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                  color: HexColor('#818993'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
