import 'package:flutter/material.dart';
import 'package:islami/tabs/radio/radio_item.dart';

class RadioScreen extends StatefulWidget {
  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  int? currentlyPlayingIndex;
  List<String> radio = [
    'Radio Ibrahim Al-Akdar',
    'Radio Al-Qaria Yassen',
    'Radio Ahmed Al-trabulsi',
    'Radio Addokali Mohammad Alalim'
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
