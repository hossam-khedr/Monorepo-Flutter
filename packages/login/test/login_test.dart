import 'package:bloc_test/bloc_test.dart';
import 'package:core/error/faliure.dart';
import 'package:dartz/dartz.dart';
import 'package:data/repositories/login/login_repo.dart';
import 'package:data/requests/login_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login/login_feature/logic/cubit.dart';
import 'package:login/login_feature/logic/state.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginRepo extends Mock implements LoginRepo {}

void main() {
  late LoginCubit loginCubit;
  late MockLoginRepo mockLoginRepo;

  setUp(() {
    mockLoginRepo = MockLoginRepo();
    loginCubit = LoginCubit(loginRepo: mockLoginRepo);
  });

  tearDown(() {
    loginCubit.close();
  });

  group('Login Cubit Test', () {
    final loginRequest = LoginRequest(
      nationalId: '12345678901234',
      password: '12345678',
    );

    final serverFailure = ServerFailure('SERVER FAILURE');

    blocTest<LoginCubit, LoginStats>(
      'emits [loading, success] when login is successful',
      build: () {
        when(
          () => mockLoginRepo.login(loginRequest: loginRequest),
        ).thenAnswer((_) async => Right('Login Success'));
        return loginCubit;
      },
      act: (cubit) => cubit.login(loginRequest: loginRequest),

      expect: () => [
        isA<LoginStats>().having(
          (s) => s.loginStatus,
          'status',
          LoginStatus.loading,
        ),
        isA<LoginStats>().having(
          (s) => s.loginStatus,
          'status',
          LoginStatus.success,
        ),
      ],
    );
    blocTest<LoginCubit, LoginStats>(
      'emits [loading, error] when login is failure',
      build: () {
        when(
          () => mockLoginRepo.login(loginRequest: loginRequest),
        ).thenAnswer((_) async => Left(serverFailure));
        return loginCubit;
      },
      act: (cubit) => cubit.login(loginRequest: loginRequest),

      expect: () => [
        isA<LoginStats>().having(
          (s) => s.loginStatus,
          'status',
          LoginStatus.loading,
        ),
        isA<LoginStats>().having(
          (s) => s.loginStatus,
          'status',
          LoginStatus.error,
        ),
      ],
    );
  });
}
