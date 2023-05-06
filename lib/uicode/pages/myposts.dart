import 'package:ezapplyadmin/code/managers/newsManager.dart';
import 'package:ezapplyadmin/uicode/widgets/navcards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPosts extends StatelessWidget {
  const MyPosts({super.key});

  @override
  Widget build(BuildContext context) {
    // final newslist = Provider.of<NewsManager>(context).newslist;
    Size size = MediaQuery.of(context).size;
    final colorss = Theme.of(context).colorScheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Consumer<NewsManager>(
          builder: (context, value, child) => ListView.builder(
            itemCount: value.newslist.length,
            itemBuilder: (BuildContext context, int index) {
              return newscard(context, value.newslist[index], colorss, size);
            },
          ),
        ),
      ),
    );
  }
}
