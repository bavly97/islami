import 'package:flutter/material.dart';

import 'radio_item.dart';

class RecitersScreen extends StatefulWidget {
  @override
  State<RecitersScreen> createState() => _RecitersScreenState();
}

class _RecitersScreenState extends State<RecitersScreen> {
  int? currentlyPlayingIndex;

  List<String> radio = [
    'Ibrahim Al-Akdar',
    'Akram Alalaqmi',
    'Majed Al-Enezi',
    'Malik shaibat Alhamed'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 16,
            ),
            itemCount: radio.length,
            itemBuilder: (_, index) => RadioItem(
              index: index,
              radioIsPlayed: currentlyPlayingIndex == index,
              radioMutePress: radioMutePress,
              radioPlayPress: () => radioPlayPress(index),
              text: radio[index],
            ),
          ),
        ),
      ],
    );
  }

  void radioPlayPress(int index) {
    if (currentlyPlayingIndex == index) {
      currentlyPlayingIndex = null;
    } else {
      currentlyPlayingIndex = index;
    }
    setState(() {});
  }

  void radioMutePress() {
    setState(() {});
  }
}
