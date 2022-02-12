class BlogModel {
  late String id, title, description, image;
  BlogModel({
    required this.description,
    required this.title,
    required this.id,
    required this.image,
  });
  BlogModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    description = map['description'];
    image = map['img'];
  }
}
