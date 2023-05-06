import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezapplyadmin/code/managers/utils.dart';
import 'package:ezapplyadmin/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../models/mapable/news_data.dart';

class NewsManager with ChangeNotifier {
  NewsManager() {
    getNews();
  }
  TextEditingController titlecont = TextEditingController();
  QuillController quillController = QuillController.basic();
  File? banner;
  List<NEWSDATA> newslist = [];

  pickbanner() async {
    banner = await pickImage();
    notifyListeners();
  }

  uploadNews(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    String? bannerurl;

    try {
      if (banner != null) {
        final task = await FirebaseStorage.instance
            .ref('Newsfeed')
            .child(DateTime.now().microsecondsSinceEpoch.toString())
            .putFile(banner!);
        bannerurl = await task.ref.getDownloadURL();
        print("profile url $bannerurl");
      }
      NEWSDATA newsModel = NEWSDATA(
        title: titlecont.text,
        description: jsonEncode(quillController.document.toDelta().toJson()),
        banner: bannerurl,
      );

      await FirebaseFirestore.instance
          .collection("Newsfeed")
          .add(newsModel.toMap())
          .then((value) {
        print("Posted");

        titlecont.clear();
        quillController.clear();
        banner = null;
        getNews();
        navigatorKey.currentState!.popUntil((route) => route.isFirst);

        // Navigator.popUntil(context, (route) => route.isFirst);
        notifyListeners();
        // Navigator.of(context).popUntil((route) => route.isFirst);
      });
    } catch (e) {
      // Navigator.of(context).pop();
    }
    // FirebaseFirestore.instance.collection("Newsfeed").add(),
  }

  getNews() async {
    await FirebaseFirestore.instance.collection("Newsfeed").get().then((value) {
      print(value.size);
      newslist = List.generate(value.size, (index) {
        NEWSDATA newsModel = NEWSDATA.fromMap(value.docs[index].data());
        newsModel.reff = value.docs[index].reference;
        return newsModel;
      });
    });
    notifyListeners();
  }

  deletenews({String? url, required DocumentReference reff}) async {
    try {
      if (url != null) {
        await FirebaseStorage.instance
            .refFromURL(url)
            .delete()
            .then((value) async {
          await reff.delete();
        });
      } else {
        await reff.delete();
      }
    } catch (e) {
      print("Error deleting db from cloud: $e");
    }
    getNews();
    notifyListeners();
    // FirebaseFirestore.instance.collection("Delete")
  }
}
