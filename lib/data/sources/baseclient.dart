import 'package:mvvm/data/sources/dio.dart';

class BaseNetworkClient{
  get networkClient=>WebUtil.createDio();
}