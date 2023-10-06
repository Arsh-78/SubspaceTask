import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/models/BlogsListModel.dart';

class Services{
  final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  final String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  Future<BlogsListModel> getData(context) async {
    late BlogsListModel data;
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        data = BlogsListModel.fromJson(item);// Mapping json response to our data model
      } else {
        print('Error Occurred');
      }
    } catch (e) {
      print('Error Occurred'+e.toString());
    }
    return data;
  }
}