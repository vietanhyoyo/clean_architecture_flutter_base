import 'package:clean_architecture/features/shopping/data/data_sources/local/storage.dart';
import 'package:dio/dio.dart';

Dio createDio() {
  // Create a Dio instance
  final dio = Dio();

  // Add an interceptor for the token
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      final token = Storage.getAccessToken() ?? ""; // Replace with your actual token retrieval logic
      options.headers['Authorization'] = 'Bearer $token';
      return handler.next(options); // Continue with the request
    },
    onError: (DioException error, handler) {
      // Handle errors globally
      return handler.next(error);
    },
  ));
  return dio;
}
