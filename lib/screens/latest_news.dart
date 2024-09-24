import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_stack/Api%20fetch/news_api.dart';
import 'package:news_stack/Modal/controller_latestnews.dart';
import 'package:news_stack/Modal/controller_top_news.dart';
import 'package:news_stack/components/custom_appbar.dart';
import 'package:news_stack/components/hot_news_container.dart';
import 'package:news_stack/components/latest_news_container.dart';
import 'package:news_stack/screens/search_screen.dart';

class LatestNews extends StatefulWidget {
  const LatestNews({super.key});

  @override
  State<LatestNews> createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  bool value = false;
  late List<ControllerTopNews> topNews;

  ScrollController scrollController = ScrollController();
  ScrollController hotNewsController = ScrollController();
  late List<ControllerLatestNews> news;



   getLatestNews()async{
     news = await NewsApi.fetchLatestNews();
     topNews = await NewsApi.fetchTopNews();
     print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
     print(topNews.length);
     setState(() {
       value=true;
     });
  }


  @override
  void initState() {
    getLatestNews();
    scrollController.addListener(reachLast);
    hotNewsController.addListener(reachEnd);
    super.initState();
  }

  void reachLast()async{
    if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
      news = await NewsApi.fetchLatestNews();
      setState(() {

      });
    }
  }

  void reachEnd()async{
    if(hotNewsController.position.pixels==hotNewsController.position.maxScrollExtent){
      topNews = await NewsApi.fetchTopNews();
      setState(() {

      });
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return value==false ? const Center(child: CircularProgressIndicator(
      color: Colors.red,
    ),)
        : Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppbar(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchScreen()));
      },
      drawer: (){
        _scaffoldKey.currentState?.openDrawer();
        print('drawer is pressed');
      },),
      drawer: Drawer(
        width: 220,
        backgroundColor: Colors.white70,
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
        child: Container(
          width: 100,
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hottest News",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "see all",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ],
              ),
            ),
             Padding(
              padding: EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                controller: hotNewsController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: topNews.map(
                          (e)=>HotNewsContainer(title: e.title,
                      trending: e.trending,
                      date: e.date,
                      image: e.image,
                      author: e.author,
                          url: e.url,)).toList(),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest News for you",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children:
                 news.map(
                     (e)=>LatestNewsContainer(title: e.title,
                         date: e.date,
                         image: e.image,
                         author: e.author,
                         sourceIcon: e.sourceIcon, url: e.url,
                         ),
                 ).toList(),

              ),
            )
          ],
        ),
      ),
    );
  }
}
