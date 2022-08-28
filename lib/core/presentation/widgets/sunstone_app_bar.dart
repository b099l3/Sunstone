import 'package:flutter/material.dart';

class SunstoneAppBar extends AppBar {
  SunstoneAppBar({
    Key? key,
    required String text,
    List<Widget>? actions,
  }) : super(
          key: key,
          elevation: 0,
          actions: actions,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: Text(
            text,
            style: const TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        );
}
