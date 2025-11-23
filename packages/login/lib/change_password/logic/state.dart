enum PasswordStatus{init,lading,error,success}

class PasswordStats{
  final String errorMessage;
  final PasswordStatus passwordStatus;

  bool get isLoading => passwordStatus == PasswordStatus.lading;
  bool get isError => passwordStatus == PasswordStatus.error;
  bool get isSuccess => passwordStatus == PasswordStatus.success;
  PasswordStats({
    this.errorMessage = '',
    this.passwordStatus = PasswordStatus.init,
});
  PasswordStats copyWith({
    final String? errorMessage,
    final PasswordStatus? passwordStatus,
}){
    return PasswordStats(
      errorMessage: errorMessage ?? this.errorMessage,
      passwordStatus: passwordStatus ?? this.passwordStatus,
    );
  }
}