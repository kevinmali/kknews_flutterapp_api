import 'package:flutter/material.dart';

import '../../homescreen/utils/model/news_model.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    newsmodel data = ModalRoute.of(context)!.settings.arguments as newsmodel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("News"),
      ),
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(image: NetworkImage("${data.url}"))),
        // child: Center(
        //   child: Text("${data.description}"),
        // ),
      ),
    );
  }
}
