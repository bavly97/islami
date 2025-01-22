import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class RadioItem extends StatefulWidget {
  String text;
  int index;
  bool radioIsPlayed;
  void Function() radioPlayPress;
  void Function() radioMutePress;

  RadioItem({
    required this.radioIsPlayed,
    required this.index,
    required this.radioMutePress,
    required this.radioPlayPress,
    required this.text,
  });

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool radioIsMute = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    return Container(
      height: screenSize.height * .15,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppTheme.primary,
        image: DecorationImage(
          colorFilter:
              ColorFilter.mode(AppTheme.black.withOpacity(.2), BlendMode.srcIn),
          fit: BoxFit.fill,
          image: AssetImage(widget.radioIsPlayed
              ? 'assets/images/radio_is_playing.png'
              : 'assets/images/radio_is_not_playing.png'),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.text,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppTheme.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 60,
                onPressed: () {
                  widget.radioIsPlayed = !widget.radioIsPlayed;
                  widget.radioPlayPress();
                },
                icon: Icon(
                  widget.radioIsPlayed ? Icons.pause : Icons.play_arrow_rounded,
                  color: AppTheme.black,
                ),
              ),
              IconButton(
                iconSize: 35,
                onPressed: () {
                  radioIsMute = !radioIsMute;
                  widget.radioMutePress();
                },
                icon: Icon(
                  radioIsMute
                      ? Icons.volume_off_rounded
                      : Icons.volume_up_rounded,
                  color: AppTheme.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
