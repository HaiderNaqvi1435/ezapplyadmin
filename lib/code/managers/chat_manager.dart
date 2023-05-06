import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezapplyadmin/code/models/mapable/user_data.dart';
import 'package:ezapplyadmin/main.dart';
import 'package:flutter/material.dart';

import '../../uicode/pages/navchat.dart';
import '../models/mapable/messege_data.dart';

class ChatManager with ChangeNotifier {
  TextEditingController controller = TextEditingController();
  ChatManager() {
    getUsers();
  }
  List<MESSAGEDATA> messageList = [];
  List<USERDATA> userslist = [];
  BuildContext context = navigatorKey.currentContext!;
  sendMessage(String email) async {
    MESSAGEDATA messagedata = MESSAGEDATA(
        msg: controller.text, dateTime: Timestamp.now(), isSentbyme: false);
    try {
      await FirebaseFirestore.instance
          .collection("UserData")
          .doc(email)
          .collection("ChatBox")
          .add(messagedata.toMap())
          .then((value) {
        print("message sent");
        controller.clear();
        notifyListeners();
      });
    } catch (e) {
      print("message not sent $e");
    }
  }

  getUsers() {
    try {
      FirebaseFirestore.instance.collection("UserData").get().then((value) {
        userslist = List.generate(
            value.size, (index) => USERDATA.fromMap(value.docs[index].data()));
        notifyListeners();
      });
    } catch (e) {
      print("get users $e");
    }
  }

  getMessages(String email) {
    try {
      FirebaseFirestore.instance
          .collection("UserData")
          .doc(email)
          .collection("ChatBox")
          .get()
          .then((value) {
        messageList = List.generate(value.size,
            (index) => MESSAGEDATA.fromMap(value.docs[index].data()));
        notifyListeners();

        print("getmessages");
      }).then((value) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavChat(email: email),
              )));
    } catch (e) {
      print("getmessages $e");
    }
  }
  // getMessage() async {
  //   await FirebaseFirestore.instance
  //       .collection("UserData")
  //       .doc(FirebaseAuth.instance.currentUser!.email)
  //       .collection("ChatBox")
  //       .snapshots()
  //       .listen((message) {
  //     messageList = List.generate(message.size, (index) {
  //       MESSAGEDATA messagedata =
  //           MESSAGEDATA.fromMap(message.docs[index].data());

  //       return messagedata;
  //     });
  //     print("message got");
  //     notifyListeners();
  //   });

  //   // });
  //   //     .then((value) {
  //   //
  // }
}
// MESSAGEDATA(
//       msg: "Hi",
//       dateTime: DateTime.now().subtract(Duration(days: 3, minutes: 1)),
//       isSentbyme: true),
//   MESSAGEDATA(
//       msg: "Hello",
//       dateTime: DateTime.now().subtract(Duration(days: 2, minutes: 2)),
//       isSentbyme: false),
//   MESSAGEDATA(
//       msg: "how are you",
//       dateTime: DateTime.now().subtract(Duration(days: 1, minutes: 60)),
//       isSentbyme: true),
//   MESSAGEDATA(
//       msg: "I'm Good",
//       dateTime: DateTime.now().subtract(Duration(minutes: 40)),
//       isSentbyme: false),
//   MESSAGEDATA(
//       msg: "Okay",
//       dateTime: DateTime.now().subtract(Duration(minutes: 20)),
//       isSentbyme: true),
