import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travenor/constant/theme_colors.dart';
import 'package:travenor/widget/button_block.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.white,
      appBar: AppBar(
        backgroundColor: ThemeColors.white,
        leadingWidth: 100,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ThemeColors.bgGrey
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.arrow_back_ios_new,
              color: ThemeColors.black,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Form(
              key: formKey,
              canPop: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Forgot password",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: ThemeColors.black
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Enter your email account to reset \n your password",
                    softWrap: true,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ThemeColors.subText
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: emailController,
                    focusNode: emailFocus,
                    autocorrect: false,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: ThemeColors.black
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please input your email address!";
                      }
                      return null;
                    },
                    onFieldSubmitted: (term) {
                      emailFocus.unfocus();
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ThemeColors.bgGrey,
                      hintText: "Email",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        color: ThemeColors.subText
                      ),
                      errorStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        color: ThemeColors.redError
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(14)),
                        borderSide: BorderSide(
                          color: ThemeColors.redError
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(14)),
                        borderSide: BorderSide(
                          color: ThemeColors.primary
                        )
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        borderSide: BorderSide.none
                      )
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  BtnBlock(
                    bgColor: ThemeColors.primary,
                    txtColor: ThemeColors.white,
                    onTap: () {},
                    title: "Reset Password",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}