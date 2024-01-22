import 'package:flutter/material.dart';

import '../../../utils/aps_theme.dart';

class CardMenu extends StatelessWidget {
  const CardMenu({
    super.key,
    required this.primaryTextTheme,
    required this.name1,
    required this.name2,
    required this.image,
    required this.color,
  });

  final TextTheme primaryTextTheme;
  final String name1;
  final String name2;
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name1,
                style: primaryTextTheme.displaySmall,
              ),
              Text(
                name2,
                style: primaryTextTheme.displaySmall,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: SiakadTheme.white,
                ),
                child: Text(
                  'Lihat',
                  style: primaryTextTheme.labelSmall,
                ),
              ),
            ],
          ),
          Stack(
            children: [
              const SizedBox(
                width: 110,
              ),
              Container(
                width: 80,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(90),
                  ),
                  color: Colors.white.withOpacity(0.25),
                ),
              ),
              Positioned(
                top: 15,
                left: 30,
                child: Image.asset(
                  'assets/images/$image.png',
                  scale: 2.2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
