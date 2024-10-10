import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travenor/constant/route.dart';
import 'package:travenor/constant/theme_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Material(
      color: ThemeColors.white,
      child: Scaffold(
        backgroundColor: ThemeColors.primary,
        body: Theme(
          data: ThemeData().copyWith(
            primaryColor: ThemeColors.white
          ),
          child: OnBoardingSlider(
            totalPage: 3,
            headerBackgroundColor: ThemeColors.white,
            finishButtonText: "Get Started",
            hasSkip: true,
            hasFloatingButton: true,
            onFinish: () {
              Navigator.pushReplacementNamed(context, RouteName.signIn);
            },
            skipTextButton: Text(
              "Skip",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: ThemeColors.primary
              ),
            ),
            finishButtonTextStyle: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: ThemeColors.white
            ),
            finishButtonStyle: FinishButtonStyle(
              backgroundColor: ThemeColors.primary,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))
              )
            ),
            addController: true,
            controllerColor: ThemeColors.primary,
            centerBackground: true,
            background: [
              height > 980 ? Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Container(
                    width: 580,
                    height: 580,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/board_assets/board1.jpeg",
                      width: 580,
                      height: 580,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ) : Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Container(
                    width: height < 690 ? 250 : 380,
                    height: height < 690 ? 250 : 380,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/board_assets/board1.jpeg",
                    ),
                  ),
                ),
              ),
              height > 980 ? Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Container(
                    width: 580,
                    height: 580,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/board_assets/board2.jpg",
                      width: 580,
                      height: 580,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ) : Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Container(
                    width: height < 690 ? 250 : 380,
                    height: height < 690 ? 250 : 380,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/board_assets/board2.jpg",
                    ),
                  ),
                ),
              ),
              height > 980 ? Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Container(
                    width: 580,
                    height: 580,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/board_assets/board3.jpeg",
                      width: 580,
                      height: 580,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ) : Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Container(
                    width: height < 690 ? 250 : 380,
                    height: height < 690 ? 250 : 380,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/board_assets/board3.jpeg",
                    ),
                  ),
                ),
              ), 
            ],
            speed: 1.8,
            pageBackgroundColor: ThemeColors.white,
            pageBodies: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height < 690 ? 270 : height > 1000 ? 650 : 430,
                  ),
                  Text(
                    "Life is short and the",
                    style: GoogleFonts.poppins(
                      fontSize: height > 1000 ? 50 : 30,
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.black
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "world is ",
                      style: GoogleFonts.poppins(
                        fontSize: height > 1000 ? 50 : 30,
                        fontWeight: FontWeight.bold,
                        color: ThemeColors.black
                      ),
                      children: [
                        TextSpan(
                          text: "wide",
                          style: GoogleFonts.poppins(
                            fontSize: height > 1000 ? 50 : 30,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.action
                          ),
                        )
                      ]
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: height > 1000 ? 50 : 30),
                    child: Text(
                      "At Travenor, we customize reliable and trutworthy educational tours to destinations all over the world.",
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 4,
                      style: GoogleFonts.poppins(
                        fontSize: height > 1000 ? 26 : 16,
                        color: ThemeColors.subText
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height < 690 ? 270 : height > 1000 ? 650 : 430,
                  ),
                  Text(
                    "It's a big world out",
                    style: GoogleFonts.poppins(
                      fontSize: height > 1000 ? 50 : 30,
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.black
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "there go ",
                      style: GoogleFonts.poppins(
                        fontSize: height > 1000 ? 50 : 30,
                        fontWeight: FontWeight.bold,
                        color: ThemeColors.black
                      ),
                      children: [
                        TextSpan(
                          text: "explore",
                          style: GoogleFonts.poppins(
                            fontSize: height > 1000 ? 50 : 30,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.action
                          ),
                        )
                      ]
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: height > 1000 ? 50 : 30),
                    child: Text(
                      "To get the best of your adventure you just need to leave and go where you like. we are waiting for you!",
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 4,
                      style: GoogleFonts.poppins(
                        fontSize: height > 1000 ? 26 : 16,
                        color: ThemeColors.subText
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height < 690 ? 270 : height > 1000 ? 650 : 430,
                  ),
                  Text(
                    "People don't take trips,",
                    style: GoogleFonts.poppins(
                      fontSize: height > 1000 ? 50 : 30,
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.black
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "trips take ",
                      style: GoogleFonts.poppins(
                        fontSize: height > 1000 ? 50 : 30,
                        fontWeight: FontWeight.bold,
                        color: ThemeColors.black
                      ),
                      children: [
                        TextSpan(
                          text: "people",
                          style: GoogleFonts.poppins(
                            fontSize: height > 1000 ? 50 : 30,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.action
                          ),
                        )
                      ]
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: height > 1000 ? 50 : 30),
                    child: Text(
                      "To get the best of your adventure you just need to leave and go where you like. we are waiting for you!",
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 4,
                      style: GoogleFonts.poppins(
                        fontSize: height > 1000 ? 26 : 16,
                        color: ThemeColors.subText
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}