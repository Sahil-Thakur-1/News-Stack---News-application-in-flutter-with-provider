import 'package:flutter/material.dart';
import 'package:news_stack/Api%20fetch/news_api.dart';
import 'package:news_stack/Modal/controller_news.dart';
import 'package:news_stack/components/news_container.dart';
import 'package:news_stack/provider/provider_news.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  getNews() async{
   await Provider.of<ProviderService>(context,listen: false).getdata();
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("state is building");
    return Consumer<ProviderService>(
      builder: (context, value, child) {
       return Scaffold(
          backgroundColor: Colors.white,
          body: value.isLoading ? const Center(child:CircularProgressIndicator(
            color: Colors.red,
          ))
              :PageView.builder(
              scrollDirection: Axis.vertical,
              onPageChanged: (data)async{
                await value.getdata();
              },
              itemBuilder: (context, index) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    alignment: Alignment.center,
                    child: NewsContainer(content: value.controller.content,
                      description: value.controller.description,
                      image: value.controller.image,
                      title: value.controller.title,
                      url: value.controller.url,)
                );
              }),
        );
      },
    );
  }
}

