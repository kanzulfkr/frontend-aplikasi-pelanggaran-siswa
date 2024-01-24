import 'package:flutter/material.dart';

import '../../../common/constant/aps_theme.dart';

class FormInputPassword extends StatefulWidget {
  const FormInputPassword({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  State<FormInputPassword> createState() => _FormInputPasswordState();
}

class _FormInputPasswordState extends State<FormInputPassword> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.passwordController,
      obscureText: !_isVisible,
      decoration: InputDecoration(
        hintText: 'Masukkan kata sandi anda',
        hintStyle: const TextStyle(
          color: SiakadTheme.grey,
          letterSpacing: 0.2,
          fontSize: 14,
        ),
        prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Icon(Icons.password_outlined)),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          icon: _isVisible
              ? const Icon(
                  Icons.visibility,
                  color: Colors.grey,
                )
              : const Icon(
                  Icons.visibility_off,
                  color: Colors.grey,
                ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password tidak boleh kosong.';
        }
        return null;
      },
    );
  }
}
