import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'settings_location.dart';

class SettingsScreen extends StatelessWidget {
  final _beamerKey = GlobalKey<BeamerState>();

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
                      SettingsContentLocation(routeInformation),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
