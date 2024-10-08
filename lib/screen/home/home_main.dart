import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:travenor/constant/route.dart';
import 'package:travenor/constant/theme_colors.dart';
import 'package:travenor/screen/home/favourite.dart';
import 'package:travenor/screen/home/home.dart';
import 'package:travenor/screen/home/my_trip.dart';
import 'package:travenor/screen/home/profile.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  int currentIndex = 0;

  final List<Widget> children = [
    const Home(),
    const MyTrip(),
    const Favourite(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          if (currentIndex != 0) {
            Navigator.popUntil(context, ModalRoute.withName(RouteName.home));
            setState(() {
              currentIndex = 0;
            });
          } else if (currentIndex == 0) {
            // SmartDialog.show(
            //   builder: (context) {
            //     return Container(
            //       height: 80,
            //       width: 100,
            //       decoration: BoxDecoration(
            //         color: Colors.black,
            //         borderRadius: BorderRadius.circular(10)
            //       ),
            //       alignment: Alignment.center,
            //       child: Text(
            //         "Easy Custom Dialog"
            //       ),
            //     );
            //   }
            // );
          }
        }
      },
      child: Scaffold(
        backgroundColor: ThemeColors.white,
        body: children.elementAt(currentIndex),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: SizedBox(
            height: Platform.isIOS ? 95 : 75,
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    spreadRadius: 1,
                  )
                ]
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                ),
                child: BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  currentIndex: currentIndex,
                  type: BottomNavigationBarType.fixed,
                  elevation: 28,
                  backgroundColor: ThemeColors.white,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: FaIcon(
                        FontAwesomeIcons.house,
                        size: 24,
                        color: ThemeColors.black,
                      ),
                      activeIcon: FaIcon(
                        FontAwesomeIcons.house,
                        size: 24,
                        color: ThemeColors.primary,
                      ),
                      label: ''
                    ),
                    BottomNavigationBarItem(
                      icon: FaIcon(
                        FontAwesomeIcons.paperPlane,
                        size: 24,
                        color: ThemeColors.black,
                      ),
                      activeIcon: FaIcon(
                        FontAwesomeIcons.paperPlane,
                        size: 24,
                        color: ThemeColors.primary,
                      ),
                      label: ''
                    ),
                    BottomNavigationBarItem(
                      icon: FaIcon(
                        FontAwesomeIcons.heart,
                        size: 24,
                        color: ThemeColors.black,
                      ),
                      activeIcon: FaIcon(
                        FontAwesomeIcons.heart,
                        size: 24,
                        color: ThemeColors.primary,
                      ),
                      label: ''
                    ),
                    BottomNavigationBarItem(
                      icon: FaIcon(
                        FontAwesomeIcons.user,
                        size: 24,
                        color: ThemeColors.black,
                      ),
                      activeIcon: FaIcon(
                        FontAwesomeIcons.user,
                        size: 24,
                        color: ThemeColors.primary,
                      ),
                      label: ''
                    ),
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