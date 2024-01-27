import 'package:flutter/material.dart';
import 'package:frontend_aps/common/widget/btn_secondary.dart';
import 'package:frontend_aps/data/models/response/user_poin_response_models.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../pages/s_detail_violation_screen.dart';

class ProgressPointIndicator extends StatelessWidget {
  const ProgressPointIndicator({
    super.key,
    required this.item,
  });

  final Point item;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animation: true,
      restartAnimation: true,
      animationDuration: 1000,
      radius: 120,
      lineWidth: 40,
      percent: item.pointTotal >= 40 ? 0.94 : item.pointTotal.toDouble() / 40,
      progressColor: item.pointTotal == 40 ? Colors.red : Colors.indigo,
      backgroundColor: Colors.indigo.shade100,
      circularStrokeCap: CircularStrokeCap.round,
      animateFromLastPercent: true,
      center: Text(
        '${item.pointTotal.toString()}/40',
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      footer: Padding(
        padding: const EdgeInsets.only(top: 30, right: 50, left: 50),
        child: SecondaryButton(
            name: 'Lihat Detail Pelanggaran',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DetailViolationScreen()),
              );
            }),
      ),
    );
  }
}
