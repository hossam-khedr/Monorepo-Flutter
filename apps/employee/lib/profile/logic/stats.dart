import 'package:data/responses/user_response.dart';

enum ProfileStatus { init, loading, error, success,userLoggedOut }

class ProfileStats {
  final String errorMessage;
  final ProfileStatus status;
  final UserResponse? response;

  bool get isLoading => status == ProfileStatus.loading;
  bool get isError => status == ProfileStatus.error;
  bool get isSuccess => status == ProfileStatus.success;
  bool get isUserLoggedOut => status == ProfileStatus.userLoggedOut;
  ProfileStats({
    this.errorMessage = '',
    this.status = ProfileStatus.init,
    this.response,
  });

  ProfileStats copyWith({
    final String? errorMessage,
    final ProfileStatus? status,
    final UserResponse? response,
  }) => ProfileStats(
    errorMessage: errorMessage ?? this.errorMessage,
    status: status ?? this.status,
    response: response ?? this.response,
  );
}
