import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hashcode/custom/custom_colors.dart';

class Code extends StatefulWidget {
  @override
  _CodeState createState() => _CodeState();
}

class _CodeState extends State<Code> {
  InAppWebViewController webView;
  String url = "";
  double progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 1.0,
      title: Text('About'),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );

    final body = InAppWebView(
      initialUrl: "https://repl.it/@HardikKumar1/Cpp?lite=true",
      initialHeaders: {},
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          debuggingEnabled: true,
        ),
      ),
      onWebViewCreated: (InAppWebViewController controller) {
        webView = controller;
      },
      onLoadStart: (InAppWebViewController controller, String url) {
        setState(() {
          this.url = url;
        });
      },
      onLoadStop: (InAppWebViewController controller, String url) async {
        setState(() {
          this.url = url;
        });
      },
      onProgressChanged: (InAppWebViewController controller, int progress) {
        setState(() {
          this.progress = progress / 100;
        });
      },
    );

    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}
