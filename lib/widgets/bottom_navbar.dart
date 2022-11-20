import 'package:flutter/material.dart';
import 'package:ngekost/theme.dart';

class BottomNavbarItem extends StatelessWidget {
  final String imageUrl;
  bool isActive;

  BottomNavbarItem({required this.imageUrl, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imageUrl,
          width: 26,
        ),
        Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
