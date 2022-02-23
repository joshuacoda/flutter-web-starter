import 'package:beamer/beamer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_web_starter/components/components.dart';
import 'package:flutter_web_starter/utils/utils.dart';
import 'package:flutter_web_starter/widgets/menu_button.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MenuBar extends StatelessWidget {
  MenuBar({Key? key, required this.beamerKey}) : super(key: key);
  final GlobalKey<BeamerState> beamerKey;
  @override
  Widget build(BuildContext context) {
    const Color navLinkColor = Color(0xFF6E7274);
    return Container(
      height: 66,
      decoration:
          BoxDecoration(color: Theme.of(context).cardColor, boxShadow: const [
        BoxShadow(color: Color(0x1A000000), offset: Offset(0, 2), blurRadius: 4)
      ]),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: <Widget>[
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.smallerThan(name: TABLET)],
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(Icons.menu,
                  color: Theme.of(context).brightness == Brightness.light
                      ? textPrimary
                      : Colors.white,
                  size: 28),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () =>
                  Navigator.of(context).popUntil((route) => route.isFirst),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 16, 5),
                child: Image.asset(
                    Theme.of(context).brightness == Brightness.light
                        ? "assets/images/logo_text_light.png"
                        : "assets/images/logo_text_dark.png",
                    height: 37,
                    fit: BoxFit.contain),
              ),
            ),
          ),
          const Spacer(),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: MOBILE)],
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: MenuButton(
                beamer: beamerKey,
                uri: '/home',
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Home",
                      style: TextStyle(
                          fontSize: 16,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? navLinkColor
                                  : Colors.white,
                          fontFamily: fontFamily)),
                ),
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: MOBILE)],
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: MenuButton(
                beamer: beamerKey,
                uri: '/typography',
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Typography",
                      style: TextStyle(
                          fontSize: 16,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? navLinkColor
                                  : Colors.white,
                          fontFamily: fontFamily)),
                ),
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: MOBILE)],
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: MenuButton(
                beamer: beamerKey,
                uri: '/settings',
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Settings",
                      style: TextStyle(
                          fontSize: 16,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? navLinkColor
                                  : Colors.white,
                          fontFamily: fontFamily)),
                ),
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: MOBILE)],
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 0),
              child: TextButton(
                onPressed: () =>
                    openUrl("https://flutter.dev/docs/get-started/install"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor),
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return darken(Theme.of(context).primaryColor, .1);
                        }
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed)) {
                          return darken(Theme.of(context).primaryColor, .2);
                        }
                        return Theme.of(context).primaryColor;
                      },
                    ),
                    // Shape sets the border radius from default 3 to 0.
                    shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed)) {
                          return const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)));
                        }
                        return const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)));
                      },
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            vertical: 22, horizontal: 28)),
                    // Side adds pressed highlight outline.
                    side: MaterialStateProperty.resolveWith<BorderSide>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed)) {
                        return BorderSide(
                            width: 3,
                            color: lighten(Theme.of(context).primaryColor, .1));
                      }
                      // Transparent border placeholder as Flutter does not allow
                      // negative margins.
                      return BorderSide(
                          width: 3,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.white
                                  : Colors.grey.shade800);
                    })),
                child: Text(
                  "Get started",
                  style: buttonTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
