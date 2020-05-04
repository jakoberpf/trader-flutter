class TraderRequest {
  final String userId;
  final String username;
  final String traderId;

  TraderRequest(this.userId, this.username, this.traderId);

  TraderRequest.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        username = json['username'],
        traderId = json['traderId'];

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'traderId': traderId,
    };
  }

  String toJsonString() {
    return '{\"userId\":\"$userId\",\"username\":\"$username\",,\"traderId\":\"$traderId\"}';
  }

  @override
  String toString() {
    return 'TraderRequest{userId: $userId, username: $username, traderId: $traderId}';
  }
}
