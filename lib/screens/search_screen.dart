import 'package:flutter/material.dart';
import 'package:news_stack/Api%20fetch/news_api.dart';
import 'package:news_stack/Modal/controller_latestnews.dart';
import 'package:news_stack/Modal/controller_top_news.dart';
import 'package:news_stack/components/latest_news_container.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool flag = true;
  late List<ControllerLatestNews> searchNews = [];
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    String search = '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('News Stack',style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: TextField(
              controller: controller,
              onChanged: (change){
                search = change;
              },
              decoration:  InputDecoration(
                hintText: "Search here",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2
                  )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2
                  )
                ),
                suffixIcon: Container(
                  margin: const EdgeInsets.only(right: 4),
                  child: ElevatedButton(onPressed: ()async{
                    controller.clear();
                    ControllerLatestNews.searchResult.clear();
                    searchNews = await NewsApi.fetchSearchNews(search.trim().replaceAll(" ", " AND "));
                    setState(() {

                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide.none
                    )
                  ),
                      child: const Icon(Icons.search,color: Colors.white,)
                  ),
                ),
                hintStyle: const TextStyle(
                  color: Colors.grey
                )
              ),
            )
          ),
           Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                children: searchNews.isEmpty?[]:searchNews.map(
                        (e)=>LatestNewsContainer(title: e.title,
                            date: e.date,
                            image: e.image,
                            author: e.author,
                            sourceIcon: e.sourceIcon,
                            url: e.url,
                        )).toList(),
                          ),
              ),)
        ],
      )
    );
  }
}
