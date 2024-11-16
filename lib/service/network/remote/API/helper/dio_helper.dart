import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        // 'https://rasid.com.eg:4000/', //'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  // get data
  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? query,
      String? lang,
      String? token}) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'lang': 'en',
      'Authorization': token,
    };

    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  // post data
  static Future<Response> postData(
      {required String url,
      required Map<String, dynamic>? query,
      String? token}) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'lang': 'en',
      'Authorization': token,
    };

    return await dio!.post(url, queryParameters: query);
  }
}
