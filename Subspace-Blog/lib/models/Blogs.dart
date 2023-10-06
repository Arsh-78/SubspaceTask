class Blogs {
  Blogs({
      this.id, 
      this.imageUrl, 
      this.title,});

  Blogs.fromJson(dynamic json) {
    id = json['id'];
    imageUrl = json['image_url'];
    title = json['title'];
  }
  String? id;
  String? imageUrl;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image_url'] = imageUrl;
    map['title'] = title;
    return map;
  }

}