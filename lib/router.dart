import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import 'package:flutter_web_starter/screens/news/news_screen.dart';
import 'package:flutter_web_starter/screens/settings/settings_screen.dart';
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
          child: MainWrapper(),
        )
      ];
}

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

class NewsLocation extends BeamLocation<BeamState> {
  NewsLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/news/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('news'),
          title: 'news',
          child: NewsScreen(),
        )
      ];
}

class NewsContentLocation extends BeamLocation<BeamState> {
  NewsContentLocation(RouteInformation routeInformation)
      : super(routeInformation);

  @override
  List<String> get pathPatterns => [
        '/news/authors',
        '/news/genres',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('news-home'),
          title: 'News Home',
          child: NewsHomeScreen(),
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
