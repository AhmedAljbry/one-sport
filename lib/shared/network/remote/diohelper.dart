/*
import 'package:dio/dio.dart';

class Diohelper {
  static late Dio dio;

  static init() {
    dio = Dio(
        BaseOptions(
            baseUrl: 'https://student.valuxapps.com/api/',
            receiveDataWhenStatusError: true,
          */
/*  headers: {
              'Content-Type': 'application/json',
            }*//*

        ));
  }

  static Future<Response> getdate({
    required String url,
     Map<String, dynamic>? query,
    String lang='en',
     String? token,

  }) async
  {
    dio.options.headers=
    {
      'Content-Type': 'application/json',
      'lang':lang,
      'Authorization':token??'',
    };
    return await dio.get(url, queryParameters: query,);

  }
  static Future<Response> postdate({
    required String url,
    required Map<String,dynamic> data,
     Map<String, dynamic>? query,
    String lang='ar',
    String? token,
})async
  {
    dio.options.headers={
      'Content-Type': 'application/json',
      'lang':lang,
      'Authorization':token??'',
    };
    return await dio.post(url,data: data,queryParameters: query);
  }
}

//GET ?
*/
/*
path:https://newsapi.org
mothed:/v2/top-headlines
quere:country=de&category=business&apiKey=b8de2af5b5ed4131941c5f8d6837ed54*//*

