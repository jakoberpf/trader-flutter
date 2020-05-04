class LoginRequest {
  final String username;
  final String password;

  LoginRequest(this.username, this.password);

  LoginRequest.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }

  String toJsonString() {
    return '{\"username\":\"$username\",\"password\":\"$password\"}';
  }

  @override
  String toString() {
    return 'LoginRequest{username: $username, password: $password}';
  }
}
