import 'dart:io';

import 'package:flutter/material.dart';

class UserPicture extends StatelessWidget {
  final String imagePath;
  final bool isEdit;

  const UserPicture({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildProfileImage(),
        ],
      ),
    );
  }

  Widget buildProfileImage() {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: NetworkImage(imagePath),
          fit: BoxFit.cover,
          width: 128,
          height: 128,
        ),
      ),
    );
  }
}
