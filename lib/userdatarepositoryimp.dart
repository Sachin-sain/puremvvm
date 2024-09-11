import 'package:either_dart/either.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mvvm/data/sources/restclient.dart';
import 'package:mvvm/failure.dart';
import 'package:mvvm/models/userdataresponse.dart';
import 'package:mvvm/usredatarepository.dart';
import 'Api.dart';
import 'exception.dart';

class RepositoryImp implements DataRepository {
  final RestClient _restClient = Get.find<RestClient>();

  @override
  Future<Either<Failure, UserdataResponse>> getData() async {
    try {
      final response = await _restClient.get(url: Api.userData,);
      return Right(userdataResponseFromJson(response) as UserdataResponse);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }



}