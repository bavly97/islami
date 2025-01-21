import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/app_theme.dart';

class CustomTextField extends StatelessWidget {
  void Function(String)? onChanged;
  CustomTextField({required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        style: Theme.of(context).textTheme.titleMedium,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppTheme.black.withAlpha(700),
          hintText: 'Sura Name',
          hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppTheme.white.withValues(alpha: 0.6),
              ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              'assets/icons/quran.svg',
              colorFilter: ColorFilter.mode(AppTheme.primary, BlendMode.srcIn),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.primary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.primary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
