import 'package:flutter/material.dart';
import 'package:islami/tabs/quran/most_recently_item.dart';
import 'package:islami/tabs/quran/sura_services.dart';

class MostRecentlySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: SuraServices.mostRecentlySura.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Most Recently ',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .18,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => MostRecentlyItem(
                        sura: SuraServices.mostRecentlySura.reversed
                            .toList()[index],
                      ),
                  separatorBuilder: (_, __) => SizedBox(
                        width: 10,
                      ),
                  itemCount: SuraServices.mostRecentlySura.length),
            )
          ],
        ),
      ),
    );
  }
}
