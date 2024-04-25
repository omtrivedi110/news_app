import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class NewsHelper {
  NewsHelper._();

  static final NewsHelper newsHelper = NewsHelper._();

  getContryNews({
    required String country,
    required String category,
  }) async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=11c65170db9742bc8bff3a1150737402';
    var res = await http.get(Uri.parse(url));
    var resdata = jsonDecode(res.body);
    log(resdata['articles'].toString());
    return resdata['articles'];
  }

  gettopicnews({
    required String topic,
  }) async {
    String url =
        'https://newsapi.org/v2/everything?q=$topic&apiKey=11c65170db9742bc8bff3a1150737402';
    var res = await http.get(Uri.parse(url));
    var resdata = jsonDecode(res.body);
    log(resdata['articles'].toString());
    return resdata['articles'];
  }
}
