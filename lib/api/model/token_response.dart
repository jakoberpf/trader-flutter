class TokenResponse {
  final String id;
  final String username;
  final String email;
  final List<dynamic> roles;
  final String accessToken;
  final String tokenType;

  TokenResponse(this.id, this.username, this.email, this.roles,
      this.accessToken, this.tokenType);

  TokenResponse.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        username = json['username'],
        email = json['email'],
        roles = json['roles'],
        accessToken = json['accessToken'],
        tokenType = json['tokenType'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'roles': roles,
      'accessToken': accessToken,
      'tokenType': tokenType,
    };
  }

  String toJsonString() {
    return '{\"id\": \"$id\", \"username\": \"$username\", \"email\": \"$email\", \"roles\": \"$roles\", \"accessToken\": \"$accessToken\", \"tokenType\": \"$tokenType\"}';
  }

  @override
  String toString() {
    return 'TokenResponse{id: $id, username: $username, email: $email, roles: $roles, accessToken: $accessToken, tokenType: $tokenType}';
  }
}
