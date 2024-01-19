import 'package:flutter/material.dart';

import '../../homescreen/utils/model/news_model.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});
  Color wcolor = Colors.black;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height / 1.5;
    double w = MediaQuery.of(context).size.width / 1;
    newsmodel data = ModalRoute.of(context)!.settings.arguments as newsmodel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("News"),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data.urlToImage),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        "${data.title}",
                        style: TextStyle(
                            color: wcolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${data.description}",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Click here : => ${data.url.toString()} "),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
