import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_stack/Modal/controller_latestnews.dart';
import 'package:news_stack/Modal/controller_news.dart';
import 'package:news_stack/Modal/controller_top_news.dart';



class NewsApi{
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];

  static String latestNewsKey = '';
  static String topNewsKey = '';

  static Future<Controller> fetchNews()async{
    final random = Random();
    String sourcesID = sourcesId[random.nextInt(sourcesId.length)];
    Response response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?sources=$sourcesID&apiKey=bd1bd962238247c782db1aa9968e708b'));
    Map news_data = jsonDecode(response.body);
    var article = news_data['articles'];
    final article_number = Random();
    var Article = article[article_number.nextInt(article.length)];
    print("News fetched");
    return Controller.dataTransfer(Article);
  }

  static Future<List<ControllerLatestNews>> fetchLatestNews() async{
    Uri uri;
    if(latestNewsKey==''){
   uri = Uri.parse("https://newsdata.io/api/1/latest?apikey=pub_53932005bafac81bb00a0110feddda414d89a&language=en&country=in");
   }
   else{
     uri= Uri.parse('https://newsdata.io/api/1/latest?apikey=pub_53932005bafac81bb00a0110feddda414d89a&language=en&country=in&page=${latestNewsKey}');
   }
   Response response = await http.get(uri);
    Map latest_news = jsonDecode(response.body);
    latestNewsKey = latest_news['nextPage'];
    var article = latest_news['results'];
    print("Latest news fetched");
    return ControllerLatestNews.latestDataTransfer(article);
  }

  static Future<List<ControllerTopNews>> fetchTopNews()async{
    Uri uri;
    if(topNewsKey==''){
      uri = Uri.parse("https://api.thenewsapi.com/v1/news/top?api_token=AHf9zuqU7ADTJpIZtXCWDJEuVspS464etKgjQTtu&limit=3&language=en");
    }
    else{
      uri= Uri.parse('https://api.thenewsapi.com/v1/news/top?language=en&api_token=AHf9zuqU7ADTJpIZtXCWDJEuVspS464etKgjQTtu&limit=3&page=${topNewsKey}');
    }
    Response response = await http.get(uri);
    Map top_news = jsonDecode(response.body);
    var meta=top_news['meta'];
    int page = meta['page'] ?? 0;
    topNewsKey = "${(page + 1)}";
    var article = top_news['data'];
    print("Top news fetched");
    return ControllerTopNews.topDataTransfer(article);
  }

  static Future<List<ControllerLatestNews>> fetchSearchNews(String search)async{
    Uri  uri = Uri.parse("https://newsdata.io/api/1/latest?apikey=pub_53932005bafac81bb00a0110feddda414d89a&language=en&qInMeta=$search");
    Response response = await http.get(uri);
    Map searchNews = jsonDecode(response.body);
    var article = searchNews['results'];
    print(article);
    return ControllerLatestNews.searchDataTransfer(article);
  }

}