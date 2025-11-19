enum LoginStatus{init,loading,error,success}


class LoginStats{
  final String errorMessage;
  final LoginStatus loginStatus;
  final String? userRole;

  LoginStats({
    this.errorMessage = '',
    this.loginStatus = LoginStatus.init,
    this.userRole
});

  bool get isLoading => loginStatus == LoginStatus.loading;
  bool get isError => loginStatus == LoginStatus.error;
  bool get isSuccess => loginStatus == LoginStatus.success;

  LoginStats copyWith({
    final String? errorMessage,
    final LoginStatus? loginStatus,
    final String? userRole
}){
    return LoginStats(
      errorMessage: errorMessage ?? this.errorMessage,
       loginStatus: loginStatus ?? this.loginStatus,
      userRole: userRole ?? this.userRole
    );
  }
}