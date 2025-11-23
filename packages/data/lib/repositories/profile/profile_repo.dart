import 'package:core/error/faliure.dart';
import 'package:dartz/dartz.dart';
import 'package:data/responses/user_response.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserResponse>> getUserProfile();
}
