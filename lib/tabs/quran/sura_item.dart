import 'package:flutter/material.dart';
import 'package:islami/tabs/quran/sura_data.dart';
import 'package:islami/tabs/quran/sura_details.dart';

class SuraItem extends StatelessWidget {
  SuraData sura;
  SuraItem({required this.sura});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, SuraDetails.routeName, arguments: sura),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 24),
            height: 52,
            width: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/star_shape.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Text(
              '${sura.ayatCount}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sura.englishName,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                '${sura.ayatNumber} Verses',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          Spacer(),
          Text(
            sura.arabicName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
