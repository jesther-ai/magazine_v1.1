import 'package:flutter/material.dart';
import 'package:magazine_v1/utilities/hex_color.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 130,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: HexColor('#f3f5f9'),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Hero(
        tag: imageUrl,
        transitionOnUserGestures: true,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
