// To parse this JSON data, do
//
//     final countryNewsModel = countryNewsModelFromMap(jsonString);

import 'dart:convert';

CountryNewsModel countryNewsModelFromMap(String str) =>
    CountryNewsModel.fromMap(json.decode(str));

String countryNewsModelToMap(CountryNewsModel data) =>
    json.encode(data.toMap());

class CountryNewsModel {
  List<Article>? articles;

  CountryNewsModel({
    this.articles,
  });

  CountryNewsModel copyWith({
    List<Article>? articles,
  }) =>
      CountryNewsModel(
        articles: articles ?? this.articles,
      );

  factory CountryNewsModel.fromMap(Map<String, dynamic> json) =>
      CountryNewsModel(
        articles: json["articles"] == null
            ? []
            : List<Article>.from(
                json["articles"]!.map((x) => Article.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "articles": articles == null
            ? []
            : List<dynamic>.from(articles!.map((x) => x.toMap())),
      };
}

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Article copyWith({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
  }) =>
      Article(
        source: source ?? this.source,
        author: author ?? this.author,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        urlToImage: urlToImage ?? this.urlToImage,
        publishedAt: publishedAt ?? this.publishedAt,
        content: content ?? this.content,
      );

  factory Article.fromMap(Map<String, dynamic> json) => Article(
        source: json["source"] == null ? null : Source.fromMap(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toMap() => {
        "source": source?.toMap(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
      };
}

class Source {
  Id? id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  Source copyWith({
    Id? id,
    String? name,
  }) =>
      Source(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Source.fromMap(Map<String, dynamic> json) => Source(
        id: idValues.map[json["id"]]!,
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": idValues.reverse[id],
        "name": name,
      };
}

enum Id { BBC_NEWS, BUSINESS_INSIDER, ESPN }

final idValues = EnumValues({
  "bbc-news": Id.BBC_NEWS,
  "business-insider": Id.BUSINESS_INSIDER,
  "espn": Id.ESPN
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
