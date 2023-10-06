import 'Blogs.dart';

class BlogsListModel {
  BlogsListModel({
      required this.blogs,});

  BlogsListModel.fromJson(dynamic json) {
    if (json['blogs'] != null) {
      blogs = [];
      json['blogs'].forEach((v) {
        blogs.add(Blogs.fromJson(v));
      });
    }
  }
  List<Blogs> blogs = [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (blogs != null) {
      map['blogs'] = blogs.map((v) => v.toJson()).toList();
    }
    return map;
  }

}