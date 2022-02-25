import 'package:flutter/material.dart';
import 'package:magazine_v1/utilities/hex_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.icon,
    required this.onTap,
    this.isPressed = false,
    Key? key,
  }) : super(key: key);
  final IconData? icon;
  final bool isPressed;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: isPressed ? HexColor('#3d56f0') : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isPressed ? HexColor('#3d56f0') : Colors.black26,
          ),
        ),
        child: Icon(
          icon,
          size: 35,
          color: isPressed ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
