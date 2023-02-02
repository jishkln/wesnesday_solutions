class ItemsModel {
  ItemsModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory ItemsModel.fromJson(Map<String, dynamic> json) => ItemsModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
}
