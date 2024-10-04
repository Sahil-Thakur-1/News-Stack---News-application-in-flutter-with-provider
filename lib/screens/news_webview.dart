import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatelessWidget {
  final String url;
  const NewsWebView({super.key,required this.url});

  @override
  Widget build(BuildContext context) {
    print(url);
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));
    return  Scaffold(
     appBar: AppBar(
       title: const Text("News Stack",
       style: TextStyle(
         color: Colors.white
       ),),
       centerTitle: true,
       backgroundColor: Colors.black,
       iconTheme: const IconThemeData(
         color: Colors.white
       ),
     ),
      body: WebViewWidget(controller: controller)
    );
  }
}

