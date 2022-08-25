import 'package:day007_ui_clone_2nd/post_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomepageState();
  }
}

class _HomepageState extends State<HomePage> {
  List<String> posts = [];

  /*void _incrementCounter() {
    setState(() {
      posts.add('value');
    });
  }*/

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Clone')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1 - Stories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 250,
                color: Colors.red,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    for (int i = 0; i < 3; i++)
                      Container(
                        color: Colors.yellow,
                        width: 125,
                        margin: const EdgeInsets.only(right: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [Text('Title'), Text('Description')],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            // Section 2 - Posts
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 32,
                bottom: 32,
              ),
              child: Text('Lorem'),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    for (int i = 0; i < posts.length; i++)
                      Container(
                        color: Colors.red,
                        child: Row(children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 12),
                                  height: 180,
                                  color: Colors.grey,
                                  child: Row(
                                    children: [],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8.0, top: 16),
                                  child: Text('Title'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, top: 4, bottom: 16),
                                  child: Text('Description'),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //_incrementCounter();
          //posts.add('Test Title');
          //print('${posts.length}');
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) {
              return const PostPage();
            }),
          ).then((value) {
            if (value is String) {
              setState(() {
                posts.add(value);
              });
            }
          });
        },
        tooltip: 'Increment',
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}
