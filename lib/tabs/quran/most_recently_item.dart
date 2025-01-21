import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/sura_data.dart';
import 'package:islami/tabs/quran/sura_details.dart';

class MostRecentlyItem extends StatelessWidget {
  SuraData sura;
  MostRecentlyItem({required this.sura});
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.sizeOf(context);

    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(SuraDetails.routeName, arguments: sura),
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 10),
        height: double.infinity,
        width: screenSize.width * .75,
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sura.englishName,
                  style: textTheme.titleLarge!.copyWith(color: AppTheme.black),
                ),
                Text(
                  sura.arabicName,
                  style: textTheme.titleLarge!.copyWith(color: AppTheme.black),
                ),
                Text(
                  '${sura.ayatNumber} Verses',
                  style: textTheme.titleSmall!.copyWith(color: AppTheme.black),
                ),
              ],
            ),
            Image.asset(
              'assets/images/most_recently.png',
              height: screenSize.height * .16,
              width: screenSize.width * .25,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
