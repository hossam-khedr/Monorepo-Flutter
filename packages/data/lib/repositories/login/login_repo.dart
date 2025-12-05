import 'package:core/error/faliure.dart';
import 'package:dartz/dartz.dart';
import 'package:data/requests/login_request.dart';

abstract class LoginRepo {
  Future<Either<Failure, String>> login({
    required LoginRequest loginRequest,

  });
}
