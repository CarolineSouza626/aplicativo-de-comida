class Category {
  String? id;
  String? imageUrl;
  String? title;
  String? description;

  Category({
    this.id,
    this.title,
    this.description,
  });

  Category.fronJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
    };
  }
}
