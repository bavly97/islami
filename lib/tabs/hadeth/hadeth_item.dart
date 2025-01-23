import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth_data.dart';
import 'package:islami/tabs/hadeth/hadeth_details_screen.dart';

class HadethItem extends StatefulWidget {
  int index;
  HadethItem({required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  HadethData? hadeth;

  @override
  Widget build(BuildContext context) {
    if (hadeth == null) {
      readHadethFile();
    }
    double screenHeight = MediaQuery.sizeOf(context).height;
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadethDetailsScreen.routeName, arguments: hadeth);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/frame_left.png',
                    color: AppTheme.black,
                    height: screenHeight * .1,
                    width: screenHeight * .1,
                  ),
                  Expanded(
                    child: Text(
                      hadeth?.title ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: AppTheme.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Image.asset(
                    'assets/images/frame_right.png',
                    color: AppTheme.black,
                    height: screenHeight * .1,
                    width: screenHeight * .1,
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage('assets/images/hadith_card_background.png'),
                  ),
                ),
                child: hadeth?.content == null
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppTheme.black,
                        ),
                      )
                    : ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          return Text(
                            hadeth!.content[index],
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: AppTheme.black),
                          );
                        },
                        separatorBuilder: (_, __) => SizedBox(height: 10),
                        itemCount: hadeth!.content.length),
              ),
            ),
            Image.asset(
              'assets/images/fotter.png',
              width: double.infinity,
              color: AppTheme.black,
            )
          ],
        ),
      ),
    );
  }

  Future<void> readHadethFile() async {
    String hadethFileContent = await rootBundle
        .loadString('assets/texts/Hadeeth/h${widget.index + 1}.txt');
    List<String> hadethLines = hadethFileContent.split('\n');
    String title = hadethLines[0];

    List<String> content = hadethLines.sublist(1);

    hadeth = HadethData(
      title: title,
      hadethNumber: widget.index + 1,
      content: content,
    );
    setState(() {});
  }
}
