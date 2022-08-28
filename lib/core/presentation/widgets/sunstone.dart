import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class Sunstone extends StatelessWidget {
  const Sunstone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Assets.images.sunstonePng.image(
      fit: BoxFit.fitWidth,
      filterQuality: FilterQuality.high,
    );
  }
}
