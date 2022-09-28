import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/article.dart';

const apiKey = '9afe6196d6ad48c594995dde3aa57305';
const category = 'business';
const url =
    'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey';


class ApiService {
  static Future<List<Article>> getArticles() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((article) => Article.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
