import 'package:flutter/material.dart';
import 'package:news_stack/screens/news_webview.dart';


class NewsContainer extends StatelessWidget {
  final String content;
  final String description;
  final String title;
  final String image;
  final String url;


  NewsContainer ({
    required this.content,
    required this.description,
    required this.image,
    required this.title,
    required this.url
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInImage.assetNetwork(
            width: MediaQuery.of(context).size.width,
            height: 400,
            fit: BoxFit.cover,
            fadeOutDuration: const Duration(seconds: 1),
            fadeInDuration: const Duration(seconds: 1),
            placeholder: "images/breaking news.jpg",
            image: image,
        imageErrorBuilder: (context,error,stacktrace){
              return Image.asset("images/breaking news.jpg",
              height: 400,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,);
        },),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title.length > 60 ? "${title.substring(0,60)}..." : title, style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),),
              const SizedBox(
                height: 5,
              ),
              Text(description.length > 100 ? "${description.substring(0,100)}..." : description,
                style: TextStyle(
                    fontSize: 14,
                  color: Colors.grey.shade500
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(content.length>150?"${content.substring(0,150).trim()}...":content.length < 16 ? content : "${content.substring(0,content.length-15)}...",
                maxLines: 4,
                style: const  TextStyle(
                    fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                    backgroundColor: Colors.red.shade600,
                    shadowColor: Colors.grey,
                    elevation: 5
                  ),
                  onPressed: () async{
                    url.replaceAll("http", "https");
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsWebview(url:url)));
                  }, child: const  Text("Read More",style:TextStyle(
                color: Colors.white
              ),),),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
