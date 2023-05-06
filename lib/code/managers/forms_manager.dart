
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import '../models/mapable/application_data.dart';

class FormsManager with ChangeNotifier {
  FormsManager() {
    getApplicationData();
  }
  List<APPLICATIONDATA> applicationdatalist = [];

  getApplicationData() async {
    FirebaseFirestore.instance.collection("Applications").get().then(
      (value) {
        applicationdatalist = List.generate(value.size, (index) {
          APPLICATIONDATA applicationdata =
              APPLICATIONDATA.fromMap(value.docs[index].data());
          return applicationdata;
        });
        notifyListeners();
      },
    );

    // print(applicationdatalist[0].academicdata!.map((e) => e.board));
    // print(
    //     "application .....${applicationdatalist.map((e) => e.applicationfor)}");
    // print("name.....${applicationdatalist.map((e) => e.personaldata!.name)}");
  }
}
