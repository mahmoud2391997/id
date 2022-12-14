import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:id/calendarscreen.dart';
import 'package:id/profilescreen.dart';
import 'package:id/todayscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = const Color(0xffeef444c);
  int currentIndex = 0;
  List<IconData> navigationIcons = [
    FontAwesomeIcons.bell,
    FontAwesomeIcons.candyCane,
    FontAwesomeIcons.userAlt,
  ];

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: const [
            CalendarScreen(),
            TodayScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: Container(
          height: 70,
          margin: EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: 24,
          ),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(2, 2),
                )
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.all(const Radius.circular(40)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < navigationIcons.length; i++) ...<Expanded>{
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = i;
                        });
                      },
                      child: Container(
                        height: screenHeight,
                        width: screenWidth,
                        color: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                navigationIcons[i],
                                color: i == currentIndex
                                    ? primary
                                    : Colors.black54,
                                size: i == currentIndex ? 30 : 26,
                              ),
                              i == currentIndex
                                  ? Container(
                                      margin: EdgeInsets.only(top: 6),
                                      height: 3,
                                      width: 22,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(40)),
                                        color: primary,
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                }
              ],
            ),
          ),
        ));
  }
}
