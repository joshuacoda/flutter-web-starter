import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'package:flutter_web_starter/screens/news/news_location.dart';
import 'package:flutter_web_starter/screens/settings/settings_location.dart';
import 'widgets/menu_bar.dart';

class MainWrapper extends StatelessWidget {
  final _beamerKey = GlobalKey<BeamerState>();

  MainWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 66),
          child: MenuBar(beamerKey: _beamerKey)),
      body: Row(
        children: [
          if ((context.currentBeamLocation.state as BeamState).uri.path.isEmpty)
            const Expanded(
              child: Center(
                child: Text('Home'),
              ),
            )
          else
            Expanded(
              child: ClipRRect(
                child: Beamer(
                  key: _beamerKey,
                  routerDelegate: BeamerDelegate(
                      transitionDelegate: const NoAnimationTransitionDelegate(),
                      locationBuilder: (routeInformation, _) {
                        if (routeInformation.location!.contains('news')) {
                          return NewsLocation(routeInformation);
                        }
                        if (routeInformation.location!.contains('settings')) {
                          return SettingsLocation(routeInformation);
                        } else {
                          return NewsLocation(routeInformation);
                        }
                      }),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
