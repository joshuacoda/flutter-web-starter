import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'news_location.dart';

class NewsScreen extends StatelessWidget {
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
                      NewsContentLocation(routeInformation),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
