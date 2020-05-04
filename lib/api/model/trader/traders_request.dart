class TradersRequest {
  final String userId;
  final String username;

  TradersRequest(this.userId, this.username);

  TradersRequest.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        username = json['username'];

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
    };
  }

  String toJsonString() {
    return '{\"userId\":\"$userId\",\"username\":\"$username\"}';
  }

  @override
  String toString() {
    return 'TradersRequest{userId: $userId, username: $username}';
  }
}