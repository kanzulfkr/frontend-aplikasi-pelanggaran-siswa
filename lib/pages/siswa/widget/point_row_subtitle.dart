import 'package:flutter/material.dart';
import 'package:frontend_aps/common/constant/aps_color.dart';

class RowSubTitle extends StatelessWidget {
  const RowSubTitle({
    required this.rightTitle,
    required this.leftTitle,
    super.key,
  });
  final String rightTitle;
  final String leftTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftTitle,
            style: const TextStyle(
              color: ApsColor.primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            rightTitle,
            style: const TextStyle(
              color: ApsColor.primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
