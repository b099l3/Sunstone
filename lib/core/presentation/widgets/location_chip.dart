import 'package:flutter/material.dart';

import '../../domain/location.dart';
import '../../shared/location_ext.dart';
import '../../shared/string_ext.dart';
import '../theme/text_styles.dart';

class LocationChip extends StatelessWidget {
  final Location location;
  final bool hasIcon;
  const LocationChip({
    Key? key,
    required this.location,
    this.hasIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: EdgeInsets.fromLTRB(hasIcon ? 0 : 6, 4, 6, 0),
      padding: const EdgeInsets.all(4.0),
      backgroundColor: location.color(),
      avatar: hasIcon
          ? CircleAvatar(
              backgroundColor: location.color(),
              child: const Icon(
                Icons.home,
                color: Colors.white,
              ),
            )
          : null,
      label: Text(
        location.name.capitalise(),
        textAlign: TextAlign.center,
        style: hasIcon ? TextStyles.bodyWhiteS : TextStyles.bodyWhiteXS,
      ),
    );
  }
}
