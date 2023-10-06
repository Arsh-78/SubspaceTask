
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/Blogs.dart';

import '../main.dart';
import '../providers/BlogProvider.dart';
import 'IndividualBlogScreen.dart';

class FavoritesScreen extends StatefulWidget {
   FavoritesScreen({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  List<Blogs> list=[];

  @override
  State<FavoritesScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoritesScreen>{

  @override
  void initState()
  {
    super.initState();

    final blogList = Provider.of<BlogProvider>(context,listen: false);



  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final blogListn = Provider.of<BlogProvider>(context);


    List<Blogs>blogs = blogListn.favourites;


    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(blogs.length.toString()),
      ),
      body:Material(
        child: ListView.builder(
          itemCount: blogs.length ,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>  IndividuaBlogScreen(blog: widget.list[index],)));
                },
                child: fcard(null,blogs[index], context));
          },
        ),
      ),


      /*Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Card(
          child: Column(
            children: [
              Image.network("https://cdn.pixabay.com/photo/2021/06/01/07/03/sparrow-6300790_960_720.jpg"),
              Text("Sparrow")
            ],
          ),
        )*//*Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
              blogList.data.blogs.length.toString()
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),*//*
      )*/
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget fcard(BlogProvider? favourites,Blogs blog, BuildContext context) {
  return Card(
    color: Colors.yellow[50],
    elevation: 8.0,
    margin: EdgeInsets.all(4.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Image.network(
            blog.imageUrl.toString(),
            height: MediaQuery.of(context).size.width * (3 / 4),
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Text(
          blog.title.toString(),
          style: TextStyle(
            fontSize: 38.0,
            fontWeight: FontWeight.w700,
          ),
        ),

      ],
    ),
  );
}


