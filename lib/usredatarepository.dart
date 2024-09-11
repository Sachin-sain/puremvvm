import 'package:either_dart/either.dart';

import 'failure.dart';
import 'models/userdataresponse.dart';

abstract class DataRepository{
  Future<Either<Failure,UserdataResponse>> getData();
}