import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/news_model.dart';

class news_helper {
  news_helper._();

  static news_helper api = news_helper._();

  Future<List<newsmodel>?> getdata() async {
    // String HostName = "https://newsapi.org";
    // String key = "da41188c59e140e09012695629b7a919";
    Response responce = await http.get(
      Uri.parse(
          "https://newsapi.org/v2/everything?q=tesla&from=2023-12-19&sortBy=publishedAt&apiKey=da41188c59e140e09012695629b7a919"),
    );
    log("${responce.statusCode}");
    if (responce.statusCode == 200) {
      log(responce.body);

      String JsonData = responce.body;

      Map DecodedData = jsonDecode(JsonData);

      List mapData = DecodedData['articles'];

      log("===========");
      log("===========");
      log("${mapData}");
      log("===========");
      log("===========");

      List<newsmodel> data = mapData.map((e) => newsmodel.js(data: e)).toList();

      return data;
    } else {
      return null;
    }
  }
}
