class Source {
  Source({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] = json["id"] ?? "null",
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id = id,
        "name": name,
      };
}
