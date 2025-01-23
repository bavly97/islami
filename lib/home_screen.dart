import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/radio/radio_tab.dart';
import 'package:islami/tabs/sebha/sebha_tab.dart';
import 'package:islami/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  List<String> backgroundImageName = [
    'quran_background',
    'hadeth_background',
    'sebha_background',
    'radio_background',
    'time_background'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/images/${backgroundImageName[currentIndex]}.png'),
              fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Image.asset(
                'assets/images/header.png',
                height: MediaQuery.sizeOf(context).height * .18,
              ),
              Expanded(child: tabs[currentIndex]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  height: 28,
                  width: 28,
                  fit: BoxFit.fill,
                  'assets/icons/quran.svg'),
              label: 'Quran',
              activeIcon: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                    color: AppTheme.black.withOpacity(.6),
                    borderRadius: BorderRadius.circular(66)),
                child: SvgPicture.asset(
                  height: 22,
                  width: 22,
                  fit: BoxFit.fill,
                  'assets/icons/quran.svg',
                  colorFilter:
                      ColorFilter.mode(AppTheme.white, BlendMode.srcIn),
                ),
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  height: 28,
                  width: 28,
                  fit: BoxFit.fill,
                  'assets/icons/hadeth.svg'),
              label: 'Hadeth',
              activeIcon: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                    color: AppTheme.black.withOpacity(.6),
                    borderRadius: BorderRadius.circular(66)),
                child: SvgPicture.asset(
                  height: 22,
                  width: 22,
                  fit: BoxFit.fill,
                  'assets/icons/quran.svg',
                  colorFilter:
                      ColorFilter.mode(AppTheme.white, BlendMode.srcIn),
                ),
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  height: 28,
                  width: 28,
                  fit: BoxFit.fill,
                  'assets/icons/sebha.svg'),
              label: 'Sebha',
              activeIcon: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                    color: AppTheme.black.withOpacity(.6),
                    borderRadius: BorderRadius.circular(66)),
                child: SvgPicture.asset(
                  height: 22,
                  width: 22,
                  fit: BoxFit.fill,
                  'assets/icons/quran.svg',
                  colorFilter:
                      ColorFilter.mode(AppTheme.white, BlendMode.srcIn),
                ),
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  height: 28,
                  width: 28,
                  fit: BoxFit.fill,
                  'assets/icons/radio.svg'),
              label: 'Radio',
              activeIcon: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                    color: AppTheme.black.withOpacity(.6),
                    borderRadius: BorderRadius.circular(66)),
                child: SvgPicture.asset(
                  height: 22,
                  width: 22,
                  fit: BoxFit.fill,
                  'assets/icons/quran.svg',
                  colorFilter:
                      ColorFilter.mode(AppTheme.white, BlendMode.srcIn),
                ),
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  height: 28,
                  width: 28,
                  fit: BoxFit.fill,
                  'assets/icons/time.svg'),
              label: 'Time',
              activeIcon: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                    color: AppTheme.black.withOpacity(.6),
                    borderRadius: BorderRadius.circular(66)),
                child: SvgPicture.asset(
                  height: 22,
                  width: 22,
                  fit: BoxFit.fill,
                  'assets/icons/quran.svg',
                  colorFilter:
                      ColorFilter.mode(AppTheme.white, BlendMode.srcIn),
                ),
              )),
        ],
      ),
    );
  }
}
