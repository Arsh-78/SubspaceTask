import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndividuaBlogScreen extends StatelessWidget {
  const IndividuaBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Reached Swcond Screen'),
          ],
        )
      ),
    );
  }
}