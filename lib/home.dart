import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:simple_markdown_editor/simple_markdown_editor.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _controller;
  TextEditingController? _textController;

  String text = "";

  @override
  void initState() {
    super.initState();
    _controller = TabController(initialIndex: 0, length: 2, vsync: this);
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("Markdown Editor"),
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            Tab(
              text: "Editor",
            ),
            Tab(
              text: "Previw",
            ),
          ],
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Container(
            child: MarkdownFormField(
              controller: _textController,
              enableToolBar: true,
              emojiConvert: true,
              autoCloseAfterSelectEmoji: false,
              onChanged: (String text) {
                setState(() {
                  this.text = text;
                });
              },
            ),
          ),
          Container(
            child: MarkdownBody(data: text),
          )

          //Preview(data: _textController.text),
        ],
      ),
    );
  }
}

// class Preview extends StatelessWidget {
//   const Preview({Key? key, required this.data}) : super(key: key);

//   final String data;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Markdown Parse"),
//       ),
//       body: MarkdownParse(
//         data: data,
//         onTapHastag: (String name, String match) {
//           // example : #hashtag
//           // name => hashtag
//           // match => #hashtag
//         },
//         onTapMention: (String name, String match) {
//           // example : @mention
//           // name => mention
//           // match => #mention
//         },
//       ),
//     );
//   }
// }
