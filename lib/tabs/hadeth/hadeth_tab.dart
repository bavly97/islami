import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/tabs/hadeth/hadeth_item.dart';

class HadethTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 50,
      itemBuilder: (_, index, __) => HadethItem(index: index),
      options: CarouselOptions(
        height: double.infinity,
        enlargeCenterPage: true,
        enlargeFactor: .3,
      ),
    );
  }
}
