import 'package:dartz/dartz.dart';

import '../error/error_handler.dart';
import '../error/faliure.dart';
import '../network/network_info.dart';

class ApiCallHelper {
  final NetworkInfoImpl networkInfoImpl = NetworkInfoImpl();

  Future<Either<Failure, T>> safeApiCall<T>({
    T? input,
    required Future<T> Function() callback,
  }) async {
    try {
      if (await networkInfoImpl.isConnected) {
        final result = await callback();
        return Right(result);
      } else {
        return const Left(NetworkFailure('No internet connection'));
      }
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return Left(failure);
    }
  }
}
