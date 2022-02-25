import 'package:flutter/material.dart';
import 'package:magazine_v1/utilities/hex_color.dart';

class Footer extends StatelessWidget {
  const Footer({
    required this.price,
    Key? key,
  }) : super(key: key);
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 250,
            padding: const EdgeInsets.only(left: 30, right: 20),
            decoration: BoxDecoration(
              color: HexColor('#3D56F0'),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 40,
                  width: 95,
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  decoration: BoxDecoration(
                    color: HexColor('#5468ff'),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 70,
            width: 85,
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: HexColor('#f3f5f9'),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Icon(
              Icons.local_grocery_store_outlined,
              color: HexColor('#3D56F0'),
              size: 40,
            ),
          )
        ],
      ),
    );
  }
}
