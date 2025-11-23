import 'package:data/data_soures/remote/login_remote_data_sourse.dart';
import 'package:data/data_soures/remote/profile_remote_data_source.dart';
import 'package:data/repositories/login/login_repo.dart';
import 'package:data/repositories/login/login_repo_impl.dart';
import 'package:data/repositories/profile/profile_repo.dart';
import 'package:data/repositories/profile/profile_repo_impl.dart';
import 'package:employee/profile/logic/cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:data/repositories/change_password/password_repo.dart';
import 'package:data/repositories/change_password/password_repo_impl.dart';
import 'package:data/data_soures/remote/change_password_remote_data_source.dart';
import 'package:login/change_password/logic/cubit.dart';
import 'package:login/login_feature/logic/cubit.dart';

final getIt = GetIt.instance;



// LoginDependence
Future<void> initLoginDependence() async {
  getIt.registerFactory<LoginRemoteDataSource>(
        () => LoginRemoteDataSource(),
  );
  getIt.registerFactory<LoginRepo>(
        () => LoginRepoEmpl(loginRemoteDataSource: getIt()),
  );
  getIt.registerFactory<LoginCubit>(() => LoginCubit(loginRepo: getIt()));
}

// ProfileDependence
Future<void> initProfileDependence() async {
  getIt.registerFactory<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSource(),
  );
  getIt.registerFactory<ProfileRepo>(
    () => ProfileRepoImpl(dataSource: getIt()),
  );
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(repo: getIt()));
}

// PasswordDependence
Future<void> initPasswordDependence() async {
  getIt.registerFactory<ChangePasswordRemoteDataSource>(
        () => ChangePasswordRemoteDataSource(),
  );
  getIt.registerFactory<PasswordRepo>(
        () => PasswordRepoImpl(dataSource: getIt()),
  );
  getIt.registerFactory<PasswordCubit>(() => PasswordCubit(repo: getIt()));
}
