import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'news_screen.dart';
import 'news_wrapper.dart';

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
