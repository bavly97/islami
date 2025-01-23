import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami/tabs/quran/sura_details.dart';
import 'package:islami/tabs/quran/sura_services.dart';
import 'package:islami/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SuraServices.initMostRecentlySura();
  runApp(IslamiApp());
}

class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        WelcomeScreen.routeName: (_) => WelcomeScreen(),
        SuraDetails.routeName: (_) => SuraDetails(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
      },
      initialRoute: WelcomeScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
