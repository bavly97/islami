import 'package:flutter/material.dart';

import 'package:islami/tabs/radio/radio_screen.dart';
import 'package:islami/tabs/radio/reciters_screen.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color.fromRGBO(32, 32, 32, .7),
              ),
              child: TabBar(
                tabs: [
                  Tab(
                    text: 'Radio',
                  ),
                  Tab(
                    text: 'Reciters',
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                RadioScreen(),
                RecitersScreen(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
