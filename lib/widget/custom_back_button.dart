import 'package:flutter/material.dart';
import 'package:magazine_v1/utilities/hex_color.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        height: 5,
        margin: const EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
        decoration: BoxDecoration(
          color: HexColor('#f3f5f9'),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.black26),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              Text(
                ' Back ',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
