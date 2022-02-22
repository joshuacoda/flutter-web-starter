import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'main_wrapper.dart';

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
