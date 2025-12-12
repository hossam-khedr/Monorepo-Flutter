import 'package:bloc_test/bloc_test.dart';
import 'package:core/error/faliure.dart';
import 'package:dartz/dartz.dart';
import 'package:data/repositories/change_password/password_repo.dart';
import 'package:data/requests/change_password_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login/change_password/logic/cubit.dart';
import 'package:login/change_password/logic/state.dart';
import 'package:mocktail/mocktail.dart';

class MockChangePasswordRepo extends Mock implements PasswordRepo {}

void main() {
  late PasswordCubit passwordCubit;
  late MockChangePasswordRepo passwordRepo;

  setUp(() {
    passwordRepo = MockChangePasswordRepo();
    passwordCubit = PasswordCubit(repo: passwordRepo);
  });

  tearDown(() => passwordCubit.close());

  group('Change Password Test', () {
    final passwordRequest = ChangePasswordRequest(
      oldPassword: '123456',
      newPassword: '78910',
    );
    final serverFailure = ServerFailure('SERVER FAILURE');
    blocTest<PasswordCubit, PasswordStats>(
      'emits [loading, success] when password is success',
      build: () {
        when(
          () => passwordRepo.changePassword(request: passwordRequest),
        ).thenAnswer((_) async => Right(null));
        return passwordCubit;
      },
      act: (cubit) => cubit.changePassword(request: passwordRequest),

      expect: () => [
        isA<PasswordStats>().having(
          (s) => s.passwordStatus,
          'loading',
          PasswordStatus.lading,
        ),
        isA<PasswordStats>().having(
          (s) => s.passwordStatus,
          'success',
          PasswordStatus.success,
        ),
      ],
    );
    blocTest<PasswordCubit, PasswordStats>(
      'emits [loading, failure] when password is failure',
      build: () {
        when(
          () => passwordRepo.changePassword(request: passwordRequest),
        ).thenAnswer((_) async => Left(serverFailure));
        return passwordCubit;
      },
      act: (cubit) => cubit.changePassword(request: passwordRequest),
      expect: () => [
        isA<PasswordStats>().having(
          (s) => s.passwordStatus,
          'loading',
          PasswordStatus.lading,
        ),
        isA<PasswordStats>().having(
          (s) => s.passwordStatus,
          'failure',
          PasswordStatus.error,
        ),
      ],
    );
  });
}
