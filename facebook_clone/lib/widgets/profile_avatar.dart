import 'package:facebook_clone/data/data.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar(
      {super.key, required this.imageUrl, this.isActive = false, this.hasBorder = false});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CircleAvatar(
        radius: 20,
        backgroundColor: Palette.facebookBlue,
        child: CircleAvatar(
          radius: hasBorder ? 17 : 20,
          backgroundColor: const Color(0xFFEEEEEE),
          backgroundImage: NetworkImage(imageUrl),
        ),
      ),
      isActive ? Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                color: Palette.online,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                )
            ),
          )
      ) : const SizedBox.shrink(),
    ]
    );
  }
}
