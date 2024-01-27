import 'package:flutter/material.dart';
import 'package:frontend_aps/common/constant/aps_color.dart';

class RowTitle extends StatelessWidget {
  const RowTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Akumulasi Poin Siswa',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: '',
            ),
          ),
          Icon(
            Icons.filter_list_rounded,
            color: ApsColor.primaryColor,
            size: 30,
          ),
        ],
      ),
    );
  }
}
