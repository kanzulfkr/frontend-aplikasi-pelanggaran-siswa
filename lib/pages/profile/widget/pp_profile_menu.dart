import 'package:flutter/material.dart';

import '../../../common/constant/aps_color.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.iconData,
    required this.name,
    required this.status,
  });
  final IconData iconData;
  final String name;
  final String status;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Icon(
              iconData,
              color: ApsColor.primaryColor,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        Text(
          status,
          style: const TextStyle(
            color: ApsColor.primaryColor,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
