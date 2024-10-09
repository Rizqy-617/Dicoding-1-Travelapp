import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travenor/constant/theme_colors.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final Function() onTap;
  final bool active;
  const CategoryCard({super.key, required this.image, required this.title, required this.onTap, this.active = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 68,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: active ? ThemeColors.primary : Colors.transparent,
          border: Border.all(
            color: ThemeColors.subText
          ),
          borderRadius: BorderRadius.circular(14)
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: ThemeColors.bgGrey,
                shape: BoxShape.circle
              ),
              alignment: Alignment.center,
              child: Image.asset(
                image,
                width: 25,
                height: 25,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: active ? ThemeColors.white : ThemeColors.black
              ),
            )
          ],
        ),
      ),
    );
  }
}