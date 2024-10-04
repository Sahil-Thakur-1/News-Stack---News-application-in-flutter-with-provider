import 'package:flutter/material.dart';
import 'package:news_stack/screens/news_webview.dart';

class HotNewsContainer extends StatelessWidget {
  const HotNewsContainer(
      {super.key,
        required this.title,
        required this.date,
        required this.image,
        required this.author,
        required this.trending,
        required this.url,
        });

  final String title;
  final String date;
  final String author;
  final String image;
  final String trending;
  final String url;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsWebView(url: url) ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        height: 250,
        width: 250,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),  // Set the border radius
                child: FadeInImage.assetNetwork(
                  width: 250,
                  height: 120,
                  fit: BoxFit.cover,
                  placeholder: "images/breaking news.jpg",
                  image: image,
                  imageErrorBuilder: (context, error, stacktrace) {
                    return Image.asset(
                        width: 250,
                        height: 120,
                        fit: BoxFit.cover,
                        "images/breaking news.jpg",);
                  },
                )
              ),
             const SizedBox(
                height: 10,
              ),
              Text(trending),
              const SizedBox(
                height: 5,
              ),
               Flexible(
                  child: Text(
                    title,
                    maxLines: 2,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),)),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 12.0,  // Set the width of the circle
                        height: 12.0, // Set the height of the circle
                        decoration: const BoxDecoration(
                          color: Colors.orange, // Circle color
                          shape: BoxShape.circle, // Makes the container circular
                        ),
                      ),
                      const SizedBox(width: 4.0), // Add some spacing between the circle and the text
                      Text(author.length>15?author.substring(0,15):author,style: const TextStyle(
                          color: Colors.grey
                      ),),
                    ],
                  ),
                   Text(date.substring(0,10),style: const TextStyle(
                      color: Colors.grey
                  ),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
