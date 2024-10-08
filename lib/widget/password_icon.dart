import 'package:flutter/material.dart';

class PasswordIcon extends StatelessWidget {
  final bool seePass;
  const PasswordIcon({super.key, required this.seePass});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      seePass ? 'assets/icon/light/eye-off.png' : 'assets/icon/light/eye-on.png',
      width: 20,
      height: 20,
    );
  }
}