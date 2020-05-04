class RemoveTraderRequest {
  final String userId;
  final String username;
  final String traderId;

  RemoveTraderRequest(this.userId, this.username, this.traderId);

  RemoveTraderRequest.fromJson(Map<String, dynamic> json)
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
    return 'RemoveTraderRequest{userId: $userId, username: $username, traderId: $traderId}';
  }
}