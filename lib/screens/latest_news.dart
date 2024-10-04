import 'package:flutter/material.dart';
import 'package:news_stack/components/custom_appbar.dart';
import 'package:news_stack/components/hot_news_container.dart';
import 'package:news_stack/components/latest_news_container.dart';
import 'package:news_stack/provider/provider_Latest.dart';
import 'package:news_stack/screens/search_screen.dart';
import 'package:provider/provider.dart';

class LatestNews extends StatefulWidget {
  const LatestNews({super.key});

  @override
  State<LatestNews> createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  ScrollController scrollController = ScrollController();
  ScrollController hotNewsController = ScrollController();
  bool scrollRoller = false;

   getLatestNews()async{
    await Provider.of<LatestPageProvider>(context,listen: false).getNewsData();
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
      Provider.of<LatestPageProvider>(context,listen: false).getNewsData();
    }
  }

  void reachEnd()async{
    if(hotNewsController.position.pixels==hotNewsController.position.maxScrollExtent){
      Provider.of<LatestPageProvider>(context,listen: false).getReachTop();
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print('latest news state');
    return Consumer<LatestPageProvider>(builder: (context,value,child){
       return value.isLoading ? const Center(child: CircularProgressIndicator(
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
          child: Center(
            child: Container(
              width: 100,
              child: const Text("In production",style: TextStyle(
                fontSize: 15
              ),),
            ),
          ),
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
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
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: hotNewsController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Row(
                        children: value.topNews.map(
                                (e)=>HotNewsContainer(title: e.title,
                              trending: e.trending,
                              date: e.date,
                              image: e.image,
                              author: e.author,
                              url: e.url,)).toList(),
                      ),
                      const SizedBox(
                        width:5,
                      ),
                      const SizedBox(
                        child:  CircularProgressIndicator(
                          color: Colors.red,
                        ),
                        height: 15,
                        width: 15,
                      )
                    ],
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
                  children: [
                    Column(
                      children:
                      value.latestNews.map(
                            (e)=>LatestNewsContainer(title: e.title,
                          date: e.date,
                          image: e.image,
                          author: e.author,
                          sourceIcon: e.sourceIcon, url: e.url,
                        ),
                      ).toList(),
                    ),
                     const SizedBox(
                       height: 5,
                     ),
                     const SizedBox(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                      height: 15,
                      width: 15,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
