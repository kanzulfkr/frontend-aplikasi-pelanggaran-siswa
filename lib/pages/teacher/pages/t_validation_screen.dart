import 'package:flutter/material.dart';
import 'package:frontend_aps/common/widget/custom_app_bar.dart';

class ValidationScreen extends StatelessWidget {
  const ValidationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Validasi Pelanggaran'),
      body: ListView(),
    );
  }
}
