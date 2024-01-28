import 'package:flutter/material.dart';
import 'package:frontend_aps/common/constant/aps_color.dart';

class ColumnSubtitle extends StatelessWidget {
  const ColumnSubtitle({
    required this.topTitle,
    required this.bottomTitle,
    super.key,
  });
  final String topTitle;
  final String bottomTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            topTitle,
            style: const TextStyle(
              color: ApsColor.primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            bottomTitle,
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
