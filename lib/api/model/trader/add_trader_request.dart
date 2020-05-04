class AddTraderRequest {
  final String userId;
  final String username;
  final String exchange;
  final String market;
  final String interval;
  final String strategy;
  final String isLive;
  final String isIn;
  final double budget;

  AddTraderRequest(this.userId, this.username, this.exchange, this.market,
      this.interval, this.strategy, this.isLive, this.isIn, this.budget);

  AddTraderRequest.fromJson(Map<String, dynamic> json)
      : userId = json["userId"],
        username = json['username'],
        exchange = json['exchange'],
        market = json['market'],
        interval = json['interval'],
        strategy = json['strategy'],
        isLive = json['isLive'],
        isIn = json['isIn'],
        budget = json['budget'];

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'exchange': exchange,
      'market': market,
      'interval': interval,
      'strategy': strategy,
      'isLive': isLive,
      'isIn': isIn,
      'budget': budget,
    };
  }

  String toJsonString() {
    return '{\"userId\": \"$userId\", \"username\": \"$username\", \"exchange\": \"$exchange\", \"market\": \"$market\", \"interval\": \"$interval\", \"strategy\": \"$strategy\", \"isLive\": \"$isLive\", \"isIn\": \"$isIn\", \"budget\": \"$budget\"}';
  }



  @override
  String toString() {
    return 'AddTraderRequest{userId: $userId, username: $username, exchange: $exchange, market: $market, interval: $interval, strategy: $strategy, isLive: $isLive, isIn: $isIn, budget: $budget}';
  }
}
