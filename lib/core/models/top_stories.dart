// To parse this JSON data, do
//
//     final otpResponse = otpResponseFromJson(jsonString);

import 'dart:convert';

Post postResponseFromJson(String str) => Post.fromJson(json.decode(str));


class Post {
  Post({
    this.topStories,
    this.featuredArticles,
    this.isNetworkError,
  });

  List<FeaturedArticle>? topStories;
  List<FeaturedArticle>? featuredArticles;
  bool? isNetworkError;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    topStories: List<FeaturedArticle>.from(json["topStories"].map((x) => FeaturedArticle.fromJson(x))),
    featuredArticles: List<FeaturedArticle>.from(json["featuredArticles"].map((x) => FeaturedArticle.fromJson(x))),
    isNetworkError: json["isNetworkError"],
  );
}

class FeaturedArticle {
  FeaturedArticle({
    this.id,
    this.mainMedia,
    this.categoryLabel,
    this.publishedAt,
    this.title,
    this.shortTitle,
    this.type,
    this.url,
    this.photoUrl,
    this.publishedRegions,
  });

  String? id;
  MainMedia? mainMedia;
  String? categoryLabel;
  DateTime? publishedAt;
  String? photoUrl;
  String? title;
  dynamic shortTitle;
  String? type;
  String? url;
  List<dynamic>? publishedRegions;

  factory FeaturedArticle.fromJson(Map<String, dynamic> json) => FeaturedArticle(
    photoUrl: json["photo_url"] ?? json["mainMedia"]["gallery"]["url"],
    categoryLabel: json["categoryLabel"],
    title: json["title"],
  );

  Map<String, dynamic> toJSON() {
    return {
      "photo_url" : photoUrl,
      "categoryLabel": categoryLabel,
      "title": title,
    };
  }

}

class MainMedia {
  MainMedia({
    this.id,
    this.path,
    this.gallery,
    this.thumbnail,
  });

  dynamic id;
  dynamic path;
  Gallery? gallery;
  Gallery? thumbnail;

  factory MainMedia.fromJson(Map<String, dynamic> json) => MainMedia(
    id: json["id"],
    path: json["path"],
    gallery: Gallery.fromJson(json["gallery"]),
    thumbnail: Gallery.fromJson(json["thumbnail"]),
  );

}

class Gallery {
  Gallery({
    this.url,
    this.alt,
    this.height,
    this.width,
  });

  String? url;
  String? alt;
  int? height;
  int? width;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
    url: json["url"],
    alt: json["alt"],
    height: json["height"],
    width: json["width"],
  );
}
