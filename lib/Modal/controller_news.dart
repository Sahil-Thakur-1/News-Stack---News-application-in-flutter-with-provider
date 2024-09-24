
class Controller{

  late  String content;
  late String description;
  late String title;
  late String image;
  late String url;


   Controller ({
     required this.content,
    required this.description,
    required this.image,
    required this.title,
    required this.url
  });


  static Controller dataTransfer(Map<String,dynamic> article){
    return Controller(content: article['content'] ?? "--" ,
         description: article['description'] ?? "--",
         image: article['urlToImage'] ?? "https://img.freepik.com/free-vector/breaking-news-concept_23-2148514216.jpg?w=2000",
         title: article['title'] ?? "--",
         url: article['url'] ?? "https://news.google.com/topstories?hl=en-IN&gl=IN&ceid=IN:en");
   }

}