import 'dart:collection';

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/Blogs.dart';

import 'package:untitled/providers/BlogProvider.dart';
import 'package:untitled/screens/FavouritesScreen.dart';
import 'package:untitled/screens/IndividualBlogScreen.dart';

void main() {
  runApp(
     MultiProvider(providers: [
       ChangeNotifierProvider<BlogProvider>(create: (_)=>BlogProvider())
     ],
       child: MyApp(),
     )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.

        useMaterial3: true,
        scaffoldBackgroundColor:Colors.black45
      ),
      home: const MyHomePage(title: 'Subspace Task'),
    );
  }
}

class MyHomePage extends StatefulWidget {
   const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;

  @override
  void initState()
  {
    super.initState();
     Provider.of<BlogProvider>(context, listen: false).getPostData(context);



  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final blogList = Provider.of<BlogProvider>(context);



    return Scaffold(

      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.transparent,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title,style:TextStyle(color: Colors.white,)),
      ),
      body:
      blogList.loading ? Center(
          child: Container(
            child: const CircularProgressIndicator(),
          ),
        ): ListView.builder(
          itemCount: blogList.data?.blogs.length ,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                 onTap: (){
                   Navigator.push(context,MaterialPageRoute(builder: (context) =>  IndividuaBlogScreen(blog: blogList.data!.blogs[index],)));
                 },
                child: card(blogList,blogList.data!.blogs[index], context));
          },
        ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite_border_rounded),
        backgroundColor: Colors.pink,
        onPressed: ()
        {
          Navigator.push(context,MaterialPageRoute(builder: (context) =>  FavoritesScreen()));
        },
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

Widget card(BlogProvider? favourites,Blogs blog, BuildContext context) {
  return Card(
    color: Color(0xffc3c3c),
    elevation: 8.0,
    margin: EdgeInsets.all(4.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),side:BorderSide(
      color: Colors.yellowAccent,
    ) ),
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
        Center(
          child: Text(
            blog.title.toString(),
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              color: Colors.white,

            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FavoriteButton(
              isFavorite: false,
              valueChanged: (isFavorite){
                if(isFavorite)
                  {
                    favourites?.addToFavourite(context, blog);
                  }
                else
                  {
                    favourites?.removeFromFavourite(context, blog);
                  }
              }
              ,
            )
          ],
        )
      ],
    ),
  );
}
