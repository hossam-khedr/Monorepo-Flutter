import 'package:data/repositories/login/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/login_feature/logic/state.dart';

class LoginCubit extends Cubit<LoginStats> {
  final LoginRepo loginRepo;

  LoginCubit({required this.loginRepo}) : super(LoginStats());

  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    (await loginRepo.login(email: email, password: password)).fold(
      (failure) => emit(
        state.copyWith(
          loginStatus: LoginStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (userRole) {
        emit(
          state.copyWith(loginStatus: LoginStatus.success, userRole: userRole),
        );
      },
    );
  }
}
