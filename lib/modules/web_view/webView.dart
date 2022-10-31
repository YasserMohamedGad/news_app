import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webViewScreen extends StatelessWidget {
  final String url;
  webViewScreen(this.url);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: Theme.of(context).appBarTheme.actionsIconTheme
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
