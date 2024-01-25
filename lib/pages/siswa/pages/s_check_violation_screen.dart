import 'package:flutter/material.dart';

class CheckViolationScreen extends StatefulWidget {
  const CheckViolationScreen({super.key});

  @override
  State<CheckViolationScreen> createState() => _CheckViolationScreenState();
}

class _CheckViolationScreenState extends State<CheckViolationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pelanggaran'),
        titleTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
          letterSpacing: 0.4,
        ),
        centerTitle: true,
      ),
      body: ListView(),
    );
  }
}
