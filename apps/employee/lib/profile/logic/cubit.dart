import 'package:core/constants/api_constants.dart';
import 'package:core/utils/cache_helper.dart';
import 'package:data/repositories/profile/profile_repo.dart';
import 'package:employee/profile/logic/stats.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStats> {
  final ProfileRepo repo;

  ProfileCubit({required this.repo}) : super(ProfileStats());

  Future<void> getUserProfile() async {
    emit(state.copyWith(status: ProfileStatus.loading));
    (await repo.getUserProfile()).fold(
      (failure) => emit(
        state.copyWith(
          status: ProfileStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (data) =>
          emit(state.copyWith(status: ProfileStatus.success, response: data)),
    );
  }


}
