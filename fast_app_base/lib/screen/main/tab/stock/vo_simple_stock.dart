class SimpleStock {
  final String stockName;

  SimpleStock(this.stockName);

  factory SimpleStock.fromJson(dynamic json) {
    return SimpleStock(json["name"]);
  }

  @override
  String toString() {
    // TODO: implement toString
    return stockName;
  }
}
