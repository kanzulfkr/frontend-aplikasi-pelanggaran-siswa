import 'package:flutter/material.dart';
import 'package:frontend_aps/utils/aps_theme.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.name,
    required this.onPress,
  });
  final String name;
  final Function onPress;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: SiakadTheme.primaryColor,
        foregroundColor: SiakadTheme.white,
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
        widget.onPress(); // Call the onPress function provided in the widget
      },
      child: Text(
        widget.name,
      ),
    );
  }
}
