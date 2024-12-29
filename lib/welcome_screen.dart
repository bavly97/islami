import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = '/welcome';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<String> images = [
    'assets/images/welcome.png',
    'assets/images/kabba.png',
    'assets/images/reading.png',
    'assets/images/bearish.png',
    'assets/images/radio.png',
  ];

  List<String> title = [
    '',
    'Welcome To Islami',
    'Reading the Quran',
    'Bearish',
    'Holy Quran Radio',
  ];

  List<String> text = [
    'Welcome To Islmi App',
    'We Are Very Excited To Have You In Our Community',
    'Read, and your Lord is the Most Generous',
    'Praise the name of your Lord, the Most High',
    'You can listen to the Holy Quran Radio through the application for free and easily',
  ];

  PageController controller = PageController(
    initialPage: 0,
  );
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/header.png',
            height: MediaQuery.sizeOf(context).height * .18,
          ),
          Expanded(
            child: PageView.builder(
              controller: controller,
              onPageChanged: (index) {
                currentIndex = index;
                setState(() {});
              },
              itemCount: images.length,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      images[index],
                      height: MediaQuery.sizeOf(context).height * .45,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      title[index],
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.primary),
                    ),
                    Text(
                      text[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.primary),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    controller.previousPage(
                        duration: Durations.medium1, curve: Curves.linear);
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primary),
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: images.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppTheme.primary,
                    dotColor: Color(0xff707070),
                    spacing: 11,
                    dotWidth: 10,
                    dotHeight: 10,
                  ),
                ),
                currentIndex == images.length - 1
                    ? TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(HomeScreen.routeName);
                          setState(() {});
                        },
                        child: Text(
                          'Finish',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.primary),
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          controller.nextPage(
                              duration: Durations.medium1,
                              curve: Curves.linear);
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.primary),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
