// ignore_for_file: use_key_in_widget_constructors, unnecessary_import, camel_case_types, prefer_const_constructors_in_immutables

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView_screen extends StatelessWidget {
  final String url;

  WebView_screen(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
