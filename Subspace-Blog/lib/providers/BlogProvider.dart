import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:untitled/models/Blogs.dart';
import 'package:untitled/models/BlogsListModel.dart';


import '../service/Services.dart';

class BlogProvider with ChangeNotifier {
  late BlogsListModel? data;
   List<Blogs> favourites=[];
  bool loading = false;
  Services services = Services();

  getPostData(context) async {
    loading = true;
    data = await services.getData(context);
    loading = false;

    notifyListeners();
  }

  addToFavourite(context,blog) async {
    favourites.add(blog);
    //print(favourites.toString());
    notifyListeners();
  }

  void removeFromFavourite(BuildContext context, Blogs blog) {
    if(favourites!.contains(blog)) {
      favourites?.remove(blog);
      notifyListeners();
    }
  }
}