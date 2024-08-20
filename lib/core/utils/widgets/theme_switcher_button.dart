import 'package:flutter/material.dart';

class ThemeSwitcherButton extends StatelessWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  const ThemeSwitcherButton({super.key, required this.themeNotifier});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        themeNotifier.value == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode,
        color: Theme.of(context).iconTheme.color,
      ),
      onPressed: () {
        themeNotifier.value = themeNotifier.value == ThemeMode.dark
            ? ThemeMode.light
            : ThemeMode.dark;
      },
    );
  }
}