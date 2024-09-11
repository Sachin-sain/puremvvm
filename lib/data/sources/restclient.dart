import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/data/sources/baseclient.dart';
import 'package:mvvm/data/sources/baseservices.dart';
import 'package:mvvm/exception.dart';

class RestClient implements BaseServices{

  var dioInstance=BaseNetworkClient();

  @override
  Future get({required String url, Map<String, dynamic>? params})async {
    try{
      final response=await dioInstance.networkClient.
      get(url,queryParameters:params);
      return response.data;
    }catch (e) {
      if (e is DioError) {
        if (e.error is LogoutException) {
          throw LogoutException(e.error.toString());
        } else {
          Map<String, dynamic> errorResponse = jsonDecode(e.response?.data ?? {});
          if(errorResponse.containsKey('message')) {
            final String message = errorResponse['message'];
            throw ServerException(message);
          }
          throw ServerException(e.message);
        }
      }
      if (kDebugMode) {
        print(e);
      }
      throw ServerException(Constants.someThingWentWrong);
    }

  }
  @override
  Future post({required String url, required Map<String, dynamic> request,Map<String, dynamic>? params}) async{
    try {
      final response = await dioInstance.networkClient.post(
          url,
          data: request,
          queryParameters: params
      );
      return response.data;
    } catch (e) {
      {if (e is DioError) {
        if (e.error is LogoutException) {
          throw LogoutException(e.error.toString());
        } else {
          Map<String, dynamic> errorResponse = jsonDecode(e.response?.data);
          final String message = errorResponse['message'] == null  ? null :
          errorResponse['message'];
          throw ServerException(e.message);
        }
      }
      if (kDebugMode) {
        print(e.toString());
      }
      throw ServerException(Constants.someThingWentWrong);
      }
    }
  }
  @override
  Future put({required String url, required Map<String, dynamic> request})async {

    try{
      final response=await dioInstance.networkClient.put(
        url,
        data:request,
      );
      return response.data;
    }catch(e){
      print(e.toString());
    }
    }

  @override
  Future patch({required String url, required Map<String, dynamic> request})async {
    final response=await dioInstance.networkClient.patch(
      url,
      data:request,
    );
    return response.data;

  }




  @override
  Future delete({required String url, required Map<String, dynamic> request}) async{
final response=await dioInstance.networkClient.delete(
  url,
  data:request
);
return response.data;
  }
}

class Constants{
  static const someThingWentWrong='Something Went Wrong';
}