import 'package:flutter/material.dart';

import 'package:flutter_web_starter/screens/news/blocks/flutter_news_row.dart';
import 'package:flutter_web_starter/ui/block_wrapper.dart';

class NewsHomeScreen extends StatelessWidget {
  const NewsHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: blocks.length,
          itemBuilder: (context, index) {
            return blocks[index];
          }),
    );
  }
}

List<Widget> blocks = [
  const BlockWrapper(SizedBox(height: 12.0)),
  const BlockWrapper(FlutterNewsRow()),
];
