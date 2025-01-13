import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/sura_data.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = '/sura_detail';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> suraAyat = [];

  late SuraData sura;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    sura = ModalRoute.of(context)!.settings.arguments as SuraData;
    if (suraAyat.isEmpty) {
      readSuraFile();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(sura.englishName),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/frame_left.png',
                  height: screenHeight * .1,
                  width: screenHeight * .1,
                ),
                Text(
                  sura.arabicName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: AppTheme.primary),
                ),
                Image.asset(
                  'assets/images/frame_right.png',
                  height: screenHeight * .1,
                  width: screenHeight * .1,
                )
              ],
            ),
          ),
          suraAyat.isEmpty
              ? CircularProgressIndicator(
                  color: AppTheme.primary,
                )
              : Expanded(
                  child: ListView.separated(
                      separatorBuilder: (_, __) => SizedBox(
                            height: 10,
                          ),
                      itemBuilder: (_, index) => Text(
                            suraAyat[index],
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: AppTheme.primary),
                          ),
                      itemCount: suraAyat.length),
                ),
          Image.asset(
            'assets/images/fotter.png',
            width: double.infinity,
          ),
        ],
      ),
    );
  }

  Future<void> readSuraFile() async {
    String ayat =
        await rootBundle.loadString('assets/texts/Suras/${sura.ayatCount}.txt');
    suraAyat = ayat.split('\r\n');
    setState(() {});
  }
}
