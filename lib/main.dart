import 'package:flutter/material.dart';
import 'package:news_stack/components/bottom_navigation_bar.dart';
import 'package:news_stack/provider/provider_Latest.dart';
import 'package:news_stack/provider/provider_news.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const NewsStack());
}

class NewsStack extends StatelessWidget {
  const NewsStack({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (BuildContext context)=>ProviderService()),
          ChangeNotifierProvider(create: (BuildContext context)=>LatestPageProvider()),
        ],
        child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomNavigationBar(),
    )
    );
  }
}

