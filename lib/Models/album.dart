class Album {
  Album({
    this.userId,
    this.id,
    this.title,
  });

  int userId;
  int id;
  String title;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
    userId: json["userId"],
    id: json["id"],
    title: json["title"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "UserId": userId,
    "Id": id,
    "Title": title,
  };
}
