import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travenor/constant/route.dart';
import 'package:travenor/constant/theme_colors.dart';
import 'package:travenor/util/change_focus.dart';
import 'package:travenor/widget/button_block.dart';
import 'package:travenor/widget/password_icon.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  bool seePass = true;

  void toggle() {
    setState(() {
      seePass = !seePass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.white,
      body: SafeArea(
        child: Center(
          child: Form(
            key: formKey,
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: SizedBox(
                        height: 10,
                      ),
                    ),
                    Text(
                      "Sign up now",
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
                      "Please fill the details and create account.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ThemeColors.subText
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: nameController,
                      focusNode: nameFocus,
                      autocorrect: false,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: ThemeColors.black
                      ),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please input your name!";
                        }
                        return null;
                      },
                      onFieldSubmitted: (term) {
                        changeFocus(context, nameFocus, emailFocus);
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ThemeColors.bgGrey,
                        hintText: "Name",
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
                      height: 15,
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
                        changeFocus(context, emailFocus, passwordFocus);
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
                      height: 15,
                    ),
                    TextFormField(
                      controller: passwordController,
                      focusNode: passwordFocus,
                      autocorrect: false,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: ThemeColors.black
                      ),
                      obscureText: seePass,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please input your password!";
                        }
                        return null;
                      },
                      onFieldSubmitted: (term) async {
                        passwordFocus.unfocus();
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ThemeColors.bgGrey,
                        hintText: "Password",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 16,
                          color: ThemeColors.subText
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            toggle();
                          },
                          icon: PasswordIcon(seePass: seePass),
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
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password must be 8 character",
                        style: GoogleFonts.poppins(
                          color: ThemeColors.subText,
                          fontSize: 16
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    BtnBlock(
                      bgColor: ThemeColors.primary,
                      txtColor: ThemeColors.white,
                      onTap: () {
                        Navigator.popAndPushNamed(context, RouteName.home);
                      },
                      title: "Sign Up",
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: GoogleFonts.poppins(
                          color: ThemeColors.subText,
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),
                        children: [
                          TextSpan(
                            text: "Sign in",
                            recognizer: TapGestureRecognizer()..onTap = () {
                              Navigator.pushReplacementNamed(context, RouteName.signIn);
                            },
                            style: GoogleFonts.poppins(
                              color: ThemeColors.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w400
                            ),
                          )
                        ]
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Text(
                        "Or connect",
                        style: GoogleFonts.poppins(
                          color: ThemeColors.subText,
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlutterSocialButton(
                          onTap: () {},
                          buttonType: ButtonType.google,
                          mini: true,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        FlutterSocialButton(
                          onTap: () {},
                          buttonType: ButtonType.facebook,
                          mini: true,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        FlutterSocialButton(
                          onTap: () {},
                          buttonType: ButtonType.apple,
                          mini: true,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}