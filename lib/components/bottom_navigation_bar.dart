import 'package:flutter/material.dart';
import 'package:news_stack/screens/latest_news.dart';
import 'package:news_stack/screens/news_screen.dart';
import 'package:news_stack/screens/news_webview.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  var pageList = [const LatestNews(),const NewsScreen(),NewsWebView(url: "https://news.google.com/topstories?hl=en-IN&gl=IN&ceid=IN:en")];
  var pageNo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 20,
        mouseCursor: MouseCursor.defer,
        currentIndex: pageNo,
        onTap: (value){
          setState(() {
            pageNo = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Latest',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.web),
            label: 'Article',
          ),
        ],
      ),
      body: pageList[pageNo],
    );
  }
}
