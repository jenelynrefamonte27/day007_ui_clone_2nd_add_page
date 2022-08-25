import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  var _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Text(
              'New Post',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _textEditingController,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  /*  print(_textEditingController.text);*/
                  Navigator.pop(context, _textEditingController.text);
                },
                child: Text('Post to Timeline')),
          ]),
        ),
      ),
    );
  }
}
