import 'package:flutter/material.dart';
import 'package:news_stack/components/bottom_navigation_bar.dart';


void main() {
  runApp(const NewsStack());
}

class NewsStack extends StatelessWidget {
  const NewsStack({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomNavigationBar(),
    );
  }
}

