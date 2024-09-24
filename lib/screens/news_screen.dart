import 'package:flutter/material.dart';
import 'package:news_stack/Api%20fetch/news_api.dart';
import 'package:news_stack/Modal/controller_news.dart';
import 'package:news_stack/components/news_container.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool value = true;

  late Controller news ;
  getNews() async{
    news = await NewsApi.fetchNews();
    setState(() {
     value = false;
    });
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: value==true? const Center(child:CircularProgressIndicator(
        color: Colors.red,
      ))
          :PageView.builder(
          scrollDirection: Axis.vertical,
          onPageChanged: (value){
            getNews();
          },
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              child: NewsContainer(content: news.content, description: news.description, image: news.image, title: news.title, url: news.url,)
            );
          }),
    );
  }
}

