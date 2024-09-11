
import 'package:either_dart/either.dart';
import 'package:mvvm/models/request.dart';
import 'package:mvvm/models/response.dart';

import '../failure.dart';

abstract class AuthRepository{
  Future<Either<Failure,LoginResponse>> login(LoginRequest loginParams);

}