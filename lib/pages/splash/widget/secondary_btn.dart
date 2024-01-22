import 'package:flutter/material.dart';
import 'package:frontend_aps/utils/utils.dart';

class SecondaryButton extends StatefulWidget {
  const SecondaryButton({
    super.key,
    required this.name,
    required this.onPress,
  });
  final String name;
  final Function onPress;

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: SiakadTheme.white,
        foregroundColor: SiakadTheme.black,
        minimumSize: const Size(400, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: const BorderSide(
          color: Colors.black54,
          width: 0.5,
        ),
      ),
      onPressed: () {
        widget.onPress();
      },
      child: Text(
        widget.name,
      ),
    );
  }
}
