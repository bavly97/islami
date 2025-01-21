import 'package:flutter/material.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(onChanged: onChanged),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Suras List',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: SuraServices.searchResult.isEmpty
                ? Center(
                    child: Text(
                      'No Sura Found',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  )
                : ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) => SuraItem(
                      sura: SuraServices.searchResult[index],
                    ),
                    separatorBuilder: (_, __) => Divider(
                      indent: MediaQuery.sizeOf(context).width * .1,
                      endIndent: MediaQuery.sizeOf(context).width * .1,
                      thickness: 1,
                    ),
                    itemCount: SuraServices.searchResult.length,
                  ),
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
