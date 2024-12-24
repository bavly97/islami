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
              tabs[currentIndex],
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
            icon: SvgPicture.asset('assets/icons/quran.svg'),
            label: 'Quran',
            activeIcon: SvgPicture.asset(
              'assets/icons/quran.svg',
              colorFilter: ColorFilter.mode(AppTheme.white, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/hadeth.svg'),
            label: 'Hadeth',
            activeIcon: SvgPicture.asset(
              'assets/icons/quran.svg',
              colorFilter: ColorFilter.mode(AppTheme.white, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/sebha.svg'),
            label: 'Sebha',
            activeIcon: SvgPicture.asset(
              'assets/icons/quran.svg',
              colorFilter: ColorFilter.mode(AppTheme.white, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/radio.svg'),
            label: 'Radio',
            activeIcon: SvgPicture.asset(
              'assets/icons/quran.svg',
              colorFilter: ColorFilter.mode(AppTheme.white, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/time.svg'),
            label: 'Time',
            activeIcon: SvgPicture.asset(
              'assets/icons/quran.svg',
              colorFilter: ColorFilter.mode(AppTheme.white, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}
