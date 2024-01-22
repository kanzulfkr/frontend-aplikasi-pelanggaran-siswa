import 'package:flutter/material.dart';

import '../../../utils/aps_theme.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.iconData,
    required this.name,
    required this.status,
    // required this.onPress,
  });
  final IconData iconData;
  final String name;
  final String status;
  // final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          iconData,
          color: SiakadTheme.primaryColor,
        ),
        Container(
          width: 160,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          width: 90,
          child: Text(
            status,
            style: const TextStyle(
              color: SiakadTheme.primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
