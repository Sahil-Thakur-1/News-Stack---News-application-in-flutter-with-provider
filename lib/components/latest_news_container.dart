import 'package:flutter/material.dart';
import 'package:news_stack/screens/news_webview.dart';

class LatestNewsContainer extends StatelessWidget {
  const LatestNewsContainer(
      {super.key,
      required this.title,
      required this.date,
      required this.image,
      required this.author,
      required this.sourceIcon,
        required this.url});

  final String title;
  final String date;
  final String author;
  final String image;
  final String sourceIcon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsWebView(url: url) ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.grey.shade300),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius:  BorderRadius.circular(15),
                  child: FadeInImage.assetNetwork(
                    width: 110,
                    height: 100,
                    fit: BoxFit.cover,
                    placeholder: "images/breaking news.jpg",
                    image: image,
                    imageErrorBuilder: (context, error, stacktrace) {
                      return Image.asset(
                          width: 110,
                          height: 100,
                          fit: BoxFit.cover,
                          "images/breaking news.jpg");
                    },
                  )),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 17.0,
                            // Set the width of the circle
                            height: 17.0,
                            // Set the height of the circle
                            decoration:  BoxDecoration(
                              image: DecorationImage(image: NetworkImage(sourceIcon)),
                              // Circle color
                              shape:
                                  BoxShape.circle, // Makes the container circular
                            ),
                          ),
                          const SizedBox(width: 6.0),
                          // Add some spacing between the circle and the text
                          Text(
                            author.length>20?author.substring(0,20):author,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        title,
                        maxLines: 3,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        date,
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
