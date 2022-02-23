import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import 'package:flutter_web_starter/screens/home/home_screen.dart';
import 'package:flutter_web_starter/screens/settings/settings_screen.dart';
import 'package:flutter_web_starter/screens/typography/typography_screen.dart';
import 'widgets/menu_bar.dart';

class MainLocation extends BeamLocation<BeamState> {
  MainLocation(RouteInformation routeInformation) : super(routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: ValueKey('main-${state.uri}'),
          title: 'Main',
          child: Routes(),
        )
      ];
}

class Routes extends StatelessWidget {
  final _beamerKey = GlobalKey<BeamerState>();

  Routes({Key? key}) : super(key: key);

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
                        if (routeInformation.location!.contains('home')) {
                          return HomeLocation(routeInformation);
                        }
                        if (routeInformation.location!.contains('typography')) {
                          return TypographyLocation(routeInformation);
                        }
                        if (routeInformation.location!.contains('settings')) {
                          return SettingsLocation(routeInformation);
                        } else {
                          return HomeLocation(routeInformation);
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

class HomeLocation extends BeamLocation<BeamState> {
  HomeLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/home/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('home'),
          title: 'home',
          child: HomeScreen(),
        )
      ];
}

class HomeContentLocation extends BeamLocation<BeamState> {
  HomeContentLocation(RouteInformation routeInformation)
      : super(routeInformation);

  @override
  List<String> get pathPatterns => [
        '/home/authors',
        '/home/genres',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('home-home'),
          title: 'Home Home',
          child: HomeHomeScreen(),
        ),
      ];
}

class TypographyLocation extends BeamLocation<BeamState> {
  TypographyLocation(RouteInformation routeInformation)
      : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/typography/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('typography'),
          title: 'typography',
          child: TypographyScreen(),
        )
      ];
}

class TypographyContentLocation extends BeamLocation<BeamState> {
  TypographyContentLocation(RouteInformation routeInformation)
      : super(routeInformation);

  @override
  List<String> get pathPatterns => [
        '/home/authors',
        '/home/genres',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('typography-home'),
          title: 'Typography Home',
          child: TypographyHomeScreen(),
        ),
      ];
}

class SettingsLocation extends BeamLocation<BeamState> {
  SettingsLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/settings/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('settings'),
          title: 'Settings',
          child: SettingsScreen(),
        )
      ];
}

class SettingsContentLocation extends BeamLocation<BeamState> {
  SettingsContentLocation(RouteInformation routeInformation)
      : super(routeInformation);

  @override
  List<String> get pathPatterns => [
        '/settings/authors',
        '/settings/genres',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('settings-home'),
          title: 'Settings Home',
          child: SettingsHomeScreen(),
        ),
        // if (state.pathPatternSegments.contains('authors'))
        //   BeamPage(
        //     key: const ValueKey('articles-authors'),
        //     title: 'Articles Authors',
        //     child: ArticleAuthorsScreen(),
        //   ),
        // if (state.pathPatternSegments.contains('genres'))
        //   BeamPage(
        //     key: const ValueKey('articles-genres'),
        //     title: 'Articles Genres',
        //     child: ArticleGenresScreen(),
        //   )
      ];
}
