import 'package:ezapplyadmin/code/managers/newsManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:provider/provider.dart';

import '../widgets/buttons.dart';
import '../widgets/textinput.dart';

class NewPost extends StatelessWidget {
  const NewPost({super.key});
  @override
  Widget build(BuildContext context) {
    final colorss = Theme.of(context).colorScheme;
    final manager = Provider.of<NewsManager>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: colorss.primary,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: Text(
          'New Post',
          style: TextStyle(
            color: colorss.primary,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () async {
                await manager.uploadNews(context);
              },
              child: Text("Post")),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    bannerButton(context),
                    const SizedBox(height: 10),

                    Inputtext(hinttext: 'Title', controller: manager.titlecont),
                    const SizedBox(height: 10),
                    // inputtext(
                    //     context: context,
                    //     hinttext: 'Description',
                    //     controller: manager.descripcont),
                    SizedBox(
                      width: size.width / 1.3,
                      height: size.height / 2,
                      child: QuillEditor.basic(
                          controller: manager.quillController, readOnly: false),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  QuillToolbar.basic(controller: manager.quillController),
                ],
              )),
        ],
      ),
    );
  }
}
