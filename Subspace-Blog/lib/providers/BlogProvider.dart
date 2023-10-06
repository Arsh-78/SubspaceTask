import 'package:flutter/material.dart';
import 'package:untitled/models/BlogsListModel.dart';


import '../service/Services.dart';

class BlogProvider with ChangeNotifier {
  late BlogsListModel data;

  bool loading = false;
  Services services = Services();

  getPostData(context) async {
    loading = true;
    data = await services.getData(context);
    loading = false;

    notifyListeners();
  }
}