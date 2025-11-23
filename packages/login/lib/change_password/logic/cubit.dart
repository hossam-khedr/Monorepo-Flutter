import 'package:data/requests/change_password_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/change_password/logic/state.dart';
import 'package:data/repositories/change_password/password_repo.dart';

class PasswordCubit extends Cubit<PasswordStats> {
  final PasswordRepo repo;

  PasswordCubit({required this.repo}) : super(PasswordStats());

  Future<void> changePassword({required ChangePasswordRequest request}) async {
    emit(state.copyWith(passwordStatus: PasswordStatus.lading));
    (await repo.changePassword(request: request)).fold(
      (failure) => emit(
        state.copyWith(
          passwordStatus: PasswordStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (success) => emit(
          state.copyWith(passwordStatus: PasswordStatus.success)),
    );
  }
}
