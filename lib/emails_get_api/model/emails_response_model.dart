class EmailsResponseModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  EmailsResponseModel({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  factory EmailsResponseModel.fromJson(Map<String, dynamic> json) =>
      EmailsResponseModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );
}
