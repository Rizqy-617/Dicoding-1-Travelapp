import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travenor/constant/theme_colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
   return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icon/other/work-in-progress.png",
            width: 400,
            height: 300,
          ),
          Text(
            "WORK IN PROGRESS",
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: ThemeColors.black
            ),
          )
        ],
      ),
    );
  }
}