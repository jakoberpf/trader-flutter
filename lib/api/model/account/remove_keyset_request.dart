class RemoveKeysetRequest {
  final String id;
  final String username;
  final String exchange;

  RemoveKeysetRequest(this.id, this.username, this.exchange);

  RemoveKeysetRequest.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        username = json['username'],
        exchange = json['exchange'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'exchange': exchange,
    };
  }

  String toJsonString() {
    return '{\"id\": \"$id\", \"username\": \"$username\", \"exchange\": \"$exchange\"}';
  }

  @override
  String toString() {
    return 'RemoveKeysetRequest{id: $id, username: $username, exchange: $exchange}';
  }
}
