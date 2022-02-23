import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_web_starter/provider/theme.dart';

import 'package:flutter_web_starter/components/components.dart';
import '../widgets/primary_color_switcher.dart';
import '../widgets/theme_switcher.dart';

// https://gist.github.com/Roaa94/e270f22c0270a16748ae3193d87b4d82
class ThemeRow extends StatelessWidget {
  const ThemeRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (c, themeProvider, _) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: border)),
        margin: blockMargin,
        padding: blockPadding(context),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              children: const [
                SizedBox(height: 20),
                ThemeSwitcher(),
                SizedBox(height: 20),
                PrimaryColorSwitcher(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
