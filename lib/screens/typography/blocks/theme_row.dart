import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_starter/provider/theme.dart';

import 'package:flutter_web_starter/components/components.dart';

import 'package:flutter_web_starter/router.dart';
import 'package:flutter_web_starter/ui/block_wrapper.dart';

// https://gist.github.com/Roaa94/e270f22c0270a16748ae3193d87b4d82
class TypographyRow extends StatelessWidget {
  const TypographyRow({Key? key}) : super(key: key);

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
          child: SizedBox(
            // constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              children: const [
                TypographyContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TypographyContent extends StatelessWidget {
  const TypographyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: <Widget>[
                Container(
                  margin: marginBottom40,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: marginBottom12,
                    child: const Text("Typography", style: headlineTextStyle),
                  ),
                ),
                Container(
                  margin: marginBottom24,
                  child: const Text("Text styles for Flutter.dev",
                      style: bodyTextStyle),
                ),
                Container(
                  margin: marginBottom40,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: marginBottom12,
                    child: const Text("Basic Styles", style: headlineTextStyle),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Divider(
                    color: textPrimary,
                    height: 1,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: marginBottom24,
                    child: const Text("Headline", style: headlineTextStyle),
                  ),
                ),
                Container(
                  margin: marginBottom24,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: marginBottom24,
                    child: const Text("Headline Secondary",
                        style: headlineSecondaryTextStyle),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: marginBottom40,
                    child: const Text(
                        "Body text is the default text style. Use this text style for website content and paragraphs. This text is chosen to be easy and comfortable to read. As the default text style for large blocks of text, particular attention is placed on the choice of font. Some fonts are more comfortable to read than others.",
                        style: bodyTextStyle),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: marginBottom24,
                    child: const Text("Button Text", style: buttonTextStyle),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: marginBottom40,
                    child: const Text(
                        "Body text is the default text style. Use this text style for website content and paragraphs. This text is chosen to be easy and comfortable to read. As the default text style for large blocks of text, particular attention is placed on the choice of font. Some fonts are more comfortable to read than others.",
                        style: bodyTextStyle),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
