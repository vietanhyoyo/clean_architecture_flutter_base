import 'package:clean_architecture/core/constants/constants.dart';
import 'package:clean_architecture/features/daily_news/data/models/article.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/everything')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String ? apiKey,
    @Query("q") String ? q,
    @Query("from") String ? from,
    @Query("sortBy") String ? sortBy,
  });
}
