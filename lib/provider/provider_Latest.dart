import 'package:flutter/cupertino.dart';
import '../Api fetch/news_api.dart';
import '../Modal/controller_latestnews.dart';
import '../Modal/controller_top_news.dart';

class  LatestPageProvider extends ChangeNotifier{
  bool isLoading = true;
  List<ControllerLatestNews> latestNews=[];
  List<ControllerTopNews> topNews = [];

  getNewsData()async{
    topNews = await NewsApi.fetchTopNews();
    latestNews = await NewsApi.fetchLatestNews();
    isLoading = false;
    notifyListeners();
  }

  getReachTop()async{
    topNews = await NewsApi.fetchTopNews();
    notifyListeners();
  }

  getReachLast() async{
    latestNews = await NewsApi.fetchLatestNews();
    notifyListeners();
  }
}
