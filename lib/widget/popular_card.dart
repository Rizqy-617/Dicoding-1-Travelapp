import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travenor/constant/theme_colors.dart';

class PopularCard extends StatelessWidget {
  final String image1;
  final String name;
  final String rating;
  final String price;
  final String description;
  const PopularCard({super.key, required this.image1, required this.name, required this.rating, required this.price, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeColors.subText
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            child: Image.asset(
              image1,
              width: 120,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: ThemeColors.black
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "\$$price",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: ThemeColors.action,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.solidStar,
                      size: 20,
                      color: Colors.yellow,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const FaIcon(
                      FontAwesomeIcons.solidStar,
                      size: 20,
                      color: Colors.yellow,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const FaIcon(
                      FontAwesomeIcons.solidStar,
                      size: 20,
                      color: Colors.yellow,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const FaIcon(
                      FontAwesomeIcons.solidStar,
                      size: 20,
                      color: Colors.yellow,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    FaIcon(
                      FontAwesomeIcons.star,
                      size: 20,
                      color: ThemeColors.subText,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      rating,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: ThemeColors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 4,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: ThemeColors.subText,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}