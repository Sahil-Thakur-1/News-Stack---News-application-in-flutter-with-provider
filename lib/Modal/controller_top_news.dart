class ControllerTopNews{
  late String date;
  late String author;
  late String title;
  late String image;
  late String url;
  late String trending;


  ControllerTopNews ({
    required this.date,
    required this.author,
    required this.image,
    required this.title,
    required this.url,
    required this.trending
  });

  static List<ControllerTopNews> topNews = [];


  static List<ControllerTopNews> topDataTransfer(List<dynamic> articles){
    int length = articles.length;
    int trendingLength = topNews.length;
      for( var i=0;i<length;i++) {
        var article = articles[i];
        ControllerTopNews.topNews.add(ControllerTopNews(
          trending: "Trending no. ${trendingLength+i+1}",
          date: article['published_at'],
          author: article['source'] ?? "unknown",
          image: article['image_url'] ??
              "https://img.freepik.com/free-vector/breaking-news-concept_23-2148514216.jpg?w=2000",
          title: article['title'] ?? "--",
          url: article['url'] ??
              "https://news.google.com/topstories?hl=en-IN&gl=IN&ceid=IN:en",
        ));
      }
    return topNews;
  }


}