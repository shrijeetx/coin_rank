class ListOfCoinsResponse {
  ListOfCoinsResponse({
    this.id,
    this.name,
    this.symbol,
    this.rank,
    this.isNew,
    this.isActive,
    this.type,
  });

  String? id;
  String? name;
  String? symbol;
  String? rank;
  String? isNew;
  String? isActive;
  String? type;

  factory ListOfCoinsResponse.fromJson(Map<String, dynamic> json) => ListOfCoinsResponse(
    id: json["id"] == null ? null : json["id"].toString(),
    name: json["name"] == null ? null : json["name"].toString(),
    symbol: json["symbol"] == null ? null : json["symbol"].toString(),
    rank: json["rank"] == null ? null : json["rank"].toString(),
    isNew: json["is_new"] == null ? null : json["is_new"].toString(),
    isActive: json["is_active"] == null ? null : json["is_active"].toString(),
    type: json["type"] == null ? null : json["type"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "symbol": symbol == null ? null : symbol,
    "rank": rank == null ? null : rank,
    "is_new": isNew == null ? null : isNew,
    "is_active": isActive == null ? null : isActive,
    "type": type == null ? null : type,
  };
}
