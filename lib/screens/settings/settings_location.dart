import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'settings_screen.dart';
import 'settings_wrapper.dart';

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
