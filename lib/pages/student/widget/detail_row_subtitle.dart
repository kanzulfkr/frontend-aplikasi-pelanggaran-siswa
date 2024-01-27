import 'package:flutter/material.dart';
import 'package:frontend_aps/common/constant/aps_color.dart';

class RowSubTitle extends StatelessWidget {
  const RowSubTitle({
    required this.leftTitle,
    required this.rightTitle,
    super.key,
  });
  final String leftTitle;
  final String rightTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
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
