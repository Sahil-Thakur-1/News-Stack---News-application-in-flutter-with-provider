class ControllerLatestNews{
  late String date;
  late String author;
  late String title;
  late String image;
  late String url;
  late String sourceIcon;


  ControllerLatestNews ({
    required this.date,
    required this.author,
    required this.image,
    required this.title,
    required this.url,
    required this.sourceIcon
  });

  static List<ControllerLatestNews> latestNews = [];
  static List<ControllerLatestNews> searchResult = [];


  static List<ControllerLatestNews> latestDataTransfer(List<dynamic> articles){
    try{
      int length = articles.length;
      for( var i=0;i<length;i++){
        var article = articles[i];
        ControllerLatestNews.latestNews.add(ControllerLatestNews(
            date: article['pubDate'],
            author: article['source_name'] ?? "unknown",
            image: article['image_url'] ?? "https://img.freepik.com/free-vector/breaking-news-concept_23-2148514216.jpg?w=2000",
            title: article['title'] ?? "--",
            url: article['link']??"https://news.google.com/topstories?hl=en-IN&gl=IN&ceid=IN:en",
            sourceIcon: article['source_icon']
        ));
      }
    }
    catch(e){
      print(e);
    }
    return latestNews;
  }

  static List<ControllerLatestNews> searchDataTransfer(List<dynamic> articles){
    try{
      int length = articles.length;
      for( var i=0;i<length;i++){
        var article = articles[i];
        ControllerLatestNews.searchResult.add(ControllerLatestNews(
            date: article['pubDate'],
            author: article['source_name'] ?? "unknown",
            image: article['image_url'] ?? "https://img.freepik.com/free-vector/breaking-news-concept_23-2148514216.jpg?w=2000",
            title: article['title'] ?? "--",
            url: article['link']??"https://news.google.com/topstories?hl=en-IN&gl=IN&ceid=IN:en",
            sourceIcon: article['source_icon']
        ));
      }
    }
    catch(e){
      print(e);
    }
    return searchResult;
  }


}