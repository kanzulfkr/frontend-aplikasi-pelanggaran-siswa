import 'package:flutter/material.dart';
import 'package:frontend_aps/common/constant/aps_color.dart';

class CardStudentPoin extends StatelessWidget {
  const CardStudentPoin({
    super.key,
    required this.studentName,
    required this.className,
  });
  final String studentName;
  final String className;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            width: 80,
            child: Image.asset(
              'assets/images/profile.png',
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                studentName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                className,
                style: const TextStyle(
                  color: ApsColor.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
