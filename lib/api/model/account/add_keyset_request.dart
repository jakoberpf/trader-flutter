class AddKeysetRequest {
  final String id;
  final String username;
  final String exchange;
  final String key;
  final String secret;

  AddKeysetRequest(
      this.id, this.username, this.exchange, this.key, this.secret);

  AddKeysetRequest.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        username = json['username'],
        exchange = json['exchange'],
        key = json['key'],
        secret = json['secret'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'exchange': exchange,
      'key': key,
      'secret': secret,
    };
  }

  String toJsonString() {
    return '{\"id\": \"$id\", \"username\": \"$username\", \"exchange\": \"$exchange\", \"key\": \"$key\", \"secret\": \"$secret\"}';
  }

  @override
  String toString() {
    return 'AddKeysetRequest{id: $id, username: $username, exchange: $exchange, key: $key, secret: $secret}';
  }
}
