import 'package:flutter/material.dart';
import 'package:frontend_aps/common/constant/aps_color.dart';

class RowViolations extends StatelessWidget {
  const RowViolations({
    super.key,
    required this.i,
    required this.violationName,
    required this.point,
  });
  final int i;
  final String violationName;
  final String point;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          i.toString(),
          style: const TextStyle(
            color: ApsColor.primaryColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          width: 250,
          margin: const EdgeInsets.only(right: 30),
          child: Text(
            violationName,
            overflow: TextOverflow.fade,
            maxLines: 3,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          point,
          textAlign: TextAlign.end,
          style: const TextStyle(
            color: ApsColor.primaryColor,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
