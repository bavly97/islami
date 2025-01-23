import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth_data.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = '/hadeth-details';

  @override
  Widget build(BuildContext context) {
    HadethData hadeth =
        ModalRoute.of(context)!.settings.arguments as HadethData;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hadith ${hadeth.hadethNumber}',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: AppTheme.primary),
        ),
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
                Expanded(
                  child: Text(
                    hadeth.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: AppTheme.primary),
                  ),
                ),
                Image.asset(
                  'assets/images/frame_right.png',
                  height: screenHeight * .1,
                  width: screenHeight * .1,
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ListView.separated(
                  separatorBuilder: (_, __) => SizedBox(
                        height: 10,
                      ),
                  itemBuilder: (_, index) => Text(
                        hadeth.content[index],
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: AppTheme.primary),
                      ),
                  itemCount: hadeth.content.length),
            ),
          ),
          Image.asset(
            'assets/images/fotter.png',
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
