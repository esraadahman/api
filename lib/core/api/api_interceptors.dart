import 'package:dio/dio.dart';
import 'package:project_api/cache/cache_healper.dart';
import 'package:project_api/core/api/endPointes.dart';

class ApiInterceptor extends Interceptor {
  // send header with request
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //options.headers['accept_ language'] = "en";
    options.headers[ApiKey.token] =
        CacheHelper().getData(key: ApiKey.token) != null
            ? "blablabla${CacheHelper().getData(key: ApiKey.token)}"
            : null;
    super.onRequest(options, handler);
  }
}
