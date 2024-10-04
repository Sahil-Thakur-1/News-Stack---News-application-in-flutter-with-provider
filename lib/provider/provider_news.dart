import 'package:flutter/cupertino.dart';
import '../Api fetch/news_api.dart';
import '../Modal/controller_news.dart';

class ProviderService extends ChangeNotifier{
  bool isLoading = true;
  Controller _controller = Controller(content: '', description: '', image: '', title: '', url: '');
  get controller => _controller;

  getdata() async{
    _controller = await NewsApi.fetchNews();
    isLoading = false;
    print(_controller);
    notifyListeners();
  }

}