import 'package:clean_architecture/features/daily_news/data/models/source.dart';
import 'package:clean_architecture/features/daily_news/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel(
      {SourceModel? source,
      super.author,
      super.title,
      super.description,
      super.url,
      super.urlToImage,
      super.publishedAt,
      super.content});

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      source: SourceModel.fromJson(map['source']),
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map['urlToImage'] ?? "",
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
    );
  }
}
