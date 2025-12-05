import 'package:data/repositories/login/login_repo.dart';
import 'package:data/requests/login_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/login_feature/logic/state.dart';

class LoginCubit extends Cubit<LoginStats> {
  final LoginRepo loginRepo;

  LoginCubit({required this.loginRepo}) : super(LoginStats());

  Future<void> login({required LoginRequest loginRequest}) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    (await loginRepo.login(loginRequest: loginRequest)).fold(
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
