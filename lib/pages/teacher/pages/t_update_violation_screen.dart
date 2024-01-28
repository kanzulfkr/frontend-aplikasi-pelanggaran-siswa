import 'package:flutter/material.dart';
import '../../../common/widget/custom_app_bar.dart';
import '../widget/update_form_violation.dart';

class UpdateViolationScreen extends StatefulWidget {
  const UpdateViolationScreen({super.key});

  @override
  State<UpdateViolationScreen> createState() => _UpdateViolationScreenState();
}

class _UpdateViolationScreenState extends State<UpdateViolationScreen> {
  final siswaController = TextEditingController();
  final _abcd = [
    ['a', 1],
    ['b', 2],
    ['c', 3],
    ['d', 4],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Edit Data Pelanggaran'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                'Siswa',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: '',
                ),
              ),
            ),
            DropdownButtonFormField(
              items: _abcd.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e.toString()),
                );
              }).toList(),
              onChanged: (value) {},
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                'Petugas',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: '',
                ),
              ),
            ),
            UpdateFormViolation(controller: siswaController),
            const Padding(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                'Jenis Pelanggaran',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: '',
                ),
              ),
            ),
            UpdateFormViolation(controller: siswaController),
            const Padding(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                'Catatan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: '',
                ),
              ),
            ),
            UpdateFormViolation(controller: siswaController),
          ],
        ),
      ),
    );
  }
}
