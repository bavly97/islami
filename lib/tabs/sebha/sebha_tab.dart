import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angel = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        angel += .1;
        setState(() {});
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: AppTheme.white,
            ),
          ),
          Image.asset(
            'assets/images/sebha_head.png',
          ),
          Stack(
            children: [
              Transform.rotate(
                angle: angel,
                child: Image.asset('assets/images/sebha_body.png'),
              ),
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'سبحان الله',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.white,
                      ),
                    ),
                    Text(
                      '30',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
