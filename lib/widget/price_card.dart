import 'package:flutter/material.dart';
import 'package:magazine_v1/utilities/hex_color.dart';

class PriceCard extends StatelessWidget {
  const PriceCard({
    required this.price,
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  final String price;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.shopping_cart_outlined, color: HexColor('#2b2d3c')),
        ),
        const SizedBox(height: 5),
        Text(
          price,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 15,
            color: HexColor('#2b2d3c'),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
