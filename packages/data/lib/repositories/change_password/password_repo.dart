import 'package:core/error/faliure.dart';
import 'package:dartz/dartz.dart';
import 'package:data/requests/change_password_request.dart';

abstract class PasswordRepo{

  Future<Either<Failure,void>>changePassword({required ChangePasswordRequest request});
}