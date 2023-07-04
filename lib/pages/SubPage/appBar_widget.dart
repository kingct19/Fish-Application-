import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  const icon = CupertinoIcons.moon_stars;
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: const BackButton(
      color: Colors.black54,
    ),
    elevation: 0,
    actions: [
      IconButton(
        color: Colors.black54,
        icon: const Icon(icon),
        onPressed: () {},
      ),
    ],
  );
}
