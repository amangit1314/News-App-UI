import 'package:news_app/model/source.dart';

class Article {
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] = json["author"] ?? "",
        title: json["title"],
        description: json["description"] = json["description"] ?? "",
        url: json["url"],
        urlToImage: json["urlToImage"] = json["urlToImage"] ?? "",
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] = json["content"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author = author,
        "title": title,
        "description": description = description,
        "url": url,
        "urlToImage": urlToImage = urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content = content,
      };
}
