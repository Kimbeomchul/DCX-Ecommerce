import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class View extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'http://3.35.120.54:8080/',
          javascriptMode: JavascriptMode.unrestricted,

        ),
      ),
    );
  }
}
