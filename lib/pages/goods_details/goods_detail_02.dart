import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class GoodsDetail02 extends StatefulWidget {
  GoodsDetail02({Key? key}) : super(key: key);

  @override
  _GoodsDetail02State createState() => _GoodsDetail02State();
}

class _GoodsDetail02State extends State<GoodsDetail02> {
  late WebViewControllerPlus _controller;

  @override
  void initState() {
    print("商品详情");
    super.initState();
    _controller = WebViewControllerPlus()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            print('onPageStarted: $url');
          },
          onPageFinished: (url) {
            print('onPageFinished: $url');
          },
          onNavigationRequest: (request) {
            if (request.url.startsWith('https://www.baidu.com')) {
              return NavigationDecision.navigate;
            }
            return NavigationDecision.prevent;
          },
        ),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://www.baidu.com'));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }
}
