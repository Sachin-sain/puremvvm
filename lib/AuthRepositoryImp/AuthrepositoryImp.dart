import 'package:either_dart/either.dart';
import 'package:get/instance_manager.dart';
import 'package:mvvm/AuthRepositoryImp/AuthRepositpry.dart';
import 'package:mvvm/data/sources/restclient.dart';
import 'package:mvvm/exception.dart';
import 'package:mvvm/failure.dart';
import 'package:mvvm/models/request.dart';
import 'package:mvvm/models/response.dart';

import '../Api.dart';

class AuthRepositoryImp implements AuthRepository{
  final _restClient=Get.find<RestClient>();
  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequest loginParams)async {
    try{
      final response=await _restClient.post(
          url: Api.loginApi,
          request:loginParams.toJson() );
      return Right(loginResponseFromJson(response));

    }on ServerException catch (e){
      return Left(ServerFailure(e.message));
    }

    }

  }
