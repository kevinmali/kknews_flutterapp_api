import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kknews_flutter_api/views/homescreen/utils/helper/news_api_helper.dart';
import 'package:kknews_flutter_api/views/homescreen/utils/model/news_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("KK News"),
      ),
      body: FutureBuilder(
          future: news_helper.api.getdata(),
          builder: (ctx, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.data != null) {
              List<newsmodel>? data = snapshot.data;
              log("========");
              log("${data}");
              log("========");
              return ListView.builder(
                itemCount: data!.length,
                itemBuilder: (ctx, i) {
                  return Column(children: [
                    ListTile(
                      tileColor: Colors.blue.shade200,
                      selectedColor: Colors.black38,
                      splashColor: Colors.blue.shade300,
                      focusColor: Colors.blueAccent,
                      autofocus: true,
                      shape: Border(
                        left: BorderSide(color: Colors.blue.shade100),
                        top: BorderSide(color: Colors.blue.shade100),
                        bottom: BorderSide(color: Colors.blue.shade100),
                        right: BorderSide(color: Colors.blue.shade100),
                      ),
                      hoverColor: Colors.blue.shade500,
                      title: Text(
                        "${data[i].title}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, 'news',
                            arguments: data[i]);
                      },
                    ),
                    Divider(),
                  ]);
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
