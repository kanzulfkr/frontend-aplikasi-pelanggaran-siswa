import 'package:flutter/material.dart';

import '../../common/widget/custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Notifikasi'),
      body: ListView(
        children: const [
          Text('tes'),
        ],
      ),
    );
  }
}
