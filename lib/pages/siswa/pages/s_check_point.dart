import 'package:flutter/material.dart';
import '../../../common/constant/aps_color.dart';
import '../widget/point_component.dart';

class CheckPoint extends StatefulWidget {
  const CheckPoint({super.key});

  @override
  State<CheckPoint> createState() => _CheckPointState();
}

class _CheckPointState extends State<CheckPoint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Poin Pelanggaran Siswa',
          style: TextStyle(
            color: ApsColor.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        iconTheme: const IconThemeData(
          color: ApsColor.white,
        ),
        centerTitle: true,
        backgroundColor: ApsColor.primaryColor,
      ),
      body: const CheckPoinComponent(
        hideTitle: true,
      ),
    );
  }
}
