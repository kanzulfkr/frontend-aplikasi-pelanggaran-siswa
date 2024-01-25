import 'package:flutter/material.dart';

import '../constant/aps_color.dart';

class CardMenu extends StatelessWidget {
  const CardMenu({
    super.key,
    required this.firstTitle,
    required this.secondTitle,
    required this.image,
    required this.color,
    required this.onTap,
  });

  final String firstTitle;
  final String secondTitle;
  final String image;
  final Color color;
  final Function onTap;

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
                firstTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: ApsColor.white,
                ),
              ),
              Text(
                secondTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: ApsColor.white,
                ),
              ),
              InkWell(
                onTap: () => onTap(),
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    color: Color.fromARGB(255, 244, 244, 244),
                  ),
                  child: const Text(
                    'Lihat',
                    style: TextStyle(
                      fontSize: 14,
                      color: ApsColor.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
