import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:untitled/models/Blogs.dart';

import 'FavouritesScreen.dart';

class IndividuaBlogScreen extends StatelessWidget {
  final Blogs blog;

  const IndividuaBlogScreen({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child:Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            fcard(null,blog, context),
          ],
        )
      ),
    );
  }
}
