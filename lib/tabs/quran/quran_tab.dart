import 'package:flutter/material.dart';
import 'package:islami/tabs/quran/most_recently_section.dart';
import 'package:islami/tabs/quran/sura_data.dart';
import 'package:islami/tabs/quran/sura_details.dart';
import 'package:islami/tabs/quran/sura_item.dart';
import 'package:islami/tabs/quran/sura_services.dart';
import 'package:islami/widgets/custom_text_field.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          CustomTextField(onChanged: onChanged),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MostRecentlySection(),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Suras List',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          SuraServices.searchResult.isEmpty
              ? Center(
                  child: Text(
                    'No Sura Found',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                )
              : ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    SuraData sura = SuraServices.searchResult[index];
                    return InkWell(
                      onTap: () async {
                        SuraServices.addSuraToMostRecently(sura);
                        await Navigator.pushNamed(
                            context, SuraDetails.routeName,
                            arguments: sura);
                        setState(() {});
                      },
                      child: SuraItem(
                        sura: sura,
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => Divider(
                    indent: MediaQuery.sizeOf(context).width * .1,
                    endIndent: MediaQuery.sizeOf(context).width * .1,
                    thickness: 1,
                  ),
                  itemCount: SuraServices.searchResult.length,
                ),
        ],
      ),
    );
  }

  void onChanged(String qurey) {
    SuraServices.searchSuraName(qurey);
    setState(() {});
  }
}
