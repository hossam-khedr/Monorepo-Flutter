class LeaveBalanceResponse {
  final int annual;
  final int sick;
  final int casual;

  LeaveBalanceResponse({
    required this.annual,
    required this.sick,
    required this.casual,
  });

  factory LeaveBalanceResponse.fromJson(Map<String, dynamic> json) {
    return LeaveBalanceResponse(
      annual: json['annual'],
      sick: json['sick'],
      casual: json['casual'],
    );
  }
}
