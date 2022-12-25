import 'package:flutter/material.dart';

class Helper {
  static Container buildCircleAvatar({required String avatar, bool transparentColor = false, double w = 50, double h = 50}) {
    return Container(
      width: w,
      height: h,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: transparentColor ? Colors.transparent : const Color(0xFFEFEFEF),
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(avatar),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}