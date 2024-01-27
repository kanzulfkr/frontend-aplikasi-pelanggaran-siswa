import 'package:flutter/material.dart';
import 'package:frontend_aps/common/constant/aps_color.dart';

class RowStatus extends StatelessWidget {
  const RowStatus({
    required this.leftTitle,
    required this.rightTitle,
    super.key,
  });
  final String leftTitle;
  final String rightTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            leftTitle,
            style: const TextStyle(
              color: ApsColor.primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            rightTitle,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
