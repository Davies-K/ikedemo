import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class Travelbenefit extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
  title: 'Flutter WebView Demo',
  theme: new ThemeData(
    //primarySwatch: Colors.green,
  ),
  routes: {
      "/": (_) => new WebviewScaffold(
      url: "https://www.vanguardassurance.com/products/aviation.php",
      appBar: new AppBar(
        title: const Text('Travel Benefit'),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
    ),
  },
);
  }
}

