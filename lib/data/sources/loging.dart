import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/localstorage.dart';

class Logging extends Interceptor{
 @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
   if (kDebugMode) {
     print('METHOD ::=>[${options.method}]');
     print('API URL ::=> ${options.baseUrl} ${options.path}');
     print('QUERY PARAMETERS ::=>${options.queryParameters}');
     print('REQUEST =>::${options.data}');

     options.headers['Authorization']='Bearer ${LocalStorage.getAuthToken()}';
     print('HEADERS ::=>${options.headers}');

   }
   return super.onRequest(options, handler);
  }


  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {

   if (kDebugMode) {
     print('STATUS CODE ::=>${response.statusCode}');
     print('RESPONSE ::=>${response.data}');

   }
   return super.onResponse(response, handler);
  }


  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {

   if (kDebugMode) {
     print('ERROR CODE ::=> ${err.response?.statusCode}');
     print('ERROR RESPONSE ::=>${err.response?.data}');
     print('ERROR MESSAGE ::=>${err.message}');
   }
   return super.onError(err, handler);
  }


}