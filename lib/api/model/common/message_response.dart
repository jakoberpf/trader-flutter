class MessageResponse {
  final String message;

  MessageResponse(this.message);

  MessageResponse.fromJson(Map<String, dynamic> json)
      : message = json["message"];

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }

  String toJsonString() {
    return '{\"message\": \"$message\"}';
  }

  @override
  String toString() {
    return 'MessageResponse{message: $message}';
  }
}
