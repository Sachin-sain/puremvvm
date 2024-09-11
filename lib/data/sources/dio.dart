import 'package:dio/dio.dart';
import 'package:mvvm/data/sources/loging.dart';

class WebUtil{
 static Dio createDio(){
   var dio=Dio();
   dio.options.connectTimeout=const Duration(milliseconds: 1800000);
   dio.options.receiveTimeout=const Duration(milliseconds: 1800000);
   dio.options.followRedirects=true;
   dio.options.responseType=ResponseType.plain;
   dio.interceptors.add(Logging());
   return dio;

  }


}