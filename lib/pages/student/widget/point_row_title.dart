import 'package:flutter/material.dart';
import 'package:frontend_aps/common/constant/aps_color.dart';

class RowTitle extends StatelessWidget {
  const RowTitle({
    super.key,
    required this.rowTitle,
  });
  final String rowTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            rowTitle,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: '',
            ),
          ),
          const Icon(
            Icons.filter_list_rounded,
            color: ApsColor.primaryColor,
            size: 30,
          ),
        ],
      ),
    );
  }
}
