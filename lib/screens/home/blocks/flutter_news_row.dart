import 'package:flutter/material.dart';
import 'package:flutter_web_starter/components/components.dart';
import 'package:flutter_web_starter/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FlutterHomeRow extends StatelessWidget {
  const FlutterHomeRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: blockMargin,
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        rowSpacing: 25,
        columnSpacing: 32,
        children: const [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: FlutterHomeCard(
              title: "Announcing Flutter 1.12",
              imagePath: "assets/images/news_flutter_1.12.png",
              linkUrl:
                  "https://developers.googleblog.com/2019/12/flutter-ui-ambient-computing.html",
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: FlutterHomeCard(
              title: "CodePen now supports Flutter",
              imagePath: "assets/images/news_flutter_codepen.png",
              linkUrl:
                  "https://medium.com/flutter/announcing-codepen-support-for-flutter-bb346406fe50",
            ),
          ),
        ],
      ),
    );
  }
}

class FlutterHomeCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String linkUrl;

  const FlutterHomeCard(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.linkUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            constraints: const BoxConstraints(maxHeight: 400),
            child: Image.asset(imagePath, fit: BoxFit.fitWidth),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text("Home",
                      style: bodyTextStyle.copyWith(
                          fontSize: 12, color: const Color(0xFF6C757D))),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(title, style: headlineSecondaryTextStyle),
                ),
                GestureDetector(
                  onTap: () => openUrl(linkUrl),
                  child: Text("Read More", style: bodyLinkTextStyle),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
