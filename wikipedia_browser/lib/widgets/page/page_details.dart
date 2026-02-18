import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wikipedia_browser/services/api.dart';

class PageDetails extends StatefulWidget {
  const PageDetails({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _PageDetailsState();
}

class _PageDetailsState extends State<PageDetails> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(APIService.buildMobileHtmlUri(widget.title));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
