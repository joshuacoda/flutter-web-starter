import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import 'package:flutter_web_starter/router.dart';
import 'package:flutter_web_starter/ui/block_wrapper.dart';

import 'blocks/theme_row.dart';

class TypographyScreen extends StatelessWidget {
  final _beamerKey = GlobalKey<BeamerState>();

  TypographyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: ClipRRect(
              child: Beamer(
                key: _beamerKey,
                routerDelegate: BeamerDelegate(
                  locationBuilder: (routeInformation, _) =>
                      TypographyContentLocation(routeInformation),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TypographyHomeScreen extends StatelessWidget {
  const TypographyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: blocks.length,
          itemBuilder: (context, index) {
            return blocks[index];
          }),
    );
  }
}

List<Widget> blocks = [
  const BlockWrapper(SizedBox(height: 12.0)),
  const BlockWrapper(TypographyRow()),
];
