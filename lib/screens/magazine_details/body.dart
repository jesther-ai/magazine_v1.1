import 'package:flutter/material.dart';
import 'package:magazine_v1/utilities/hex_color.dart';

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
          )
        ],
      ),
    );
  }
}
