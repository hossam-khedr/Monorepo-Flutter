import 'package:core/error/faliure.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  });
}
