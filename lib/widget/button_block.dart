import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BtnBlock extends StatelessWidget {
  final Function() onTap;
  final String title;
  final Color txtColor;
  final Color bgColor;
  const BtnBlock({super.key, required this.onTap, required this.title, required this.bgColor, required this.txtColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        splashColor: Colors.black26,
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 56,
          alignment: Alignment.center,
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
                color: txtColor
            ),
          ),
        ),
      ),
    );
  }
}