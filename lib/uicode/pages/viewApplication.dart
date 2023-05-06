import 'package:flutter/material.dart';

import '../../code/models/mapable/application_data.dart';
import '../viewWidgets/headerWidget.dart';
import '../viewWidgets/personalInfo.dart';
import '../viewWidgets/viewDocs.dart';

class ViewApplication extends StatelessWidget {
  ViewApplication({this.applicationdata, super.key});
  APPLICATIONDATA? applicationdata;
  @override
  Widget build(BuildContext context) {
    final colorss = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: colorss.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(colorss.primary),
              const Divider(
                height: 40,
              ),
              Text(
                "Personal Details",
                style: TextStyle(
                    color: colorss.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              personalInfo(colorss.primary, "Father name",
                  applicationdata!.personaldata!.fathername!),
              // personalInfo(colorss.primary, "Name", "Muhammad Haider Naqvi"),
              // personalInfo(colorss.primary, "Name", "Muhammad Haider Naqvi"),
              // personalInfo(colorss.primary, "Name", "Muhammad Haider Naqvi"),
              // personalInfo(colorss.primary, "Name", "Muhammad Haider Naqvi"),
              // personalInfo(colorss.primary, "Name", "Muhammad Haider Naqvi"),
              if (applicationdata!.academicdata != null)
                const Divider(height: 40),
              if (applicationdata!.academicdata != null)
                Text(
                  "Acadamic Details",
                  style: TextStyle(
                      color: colorss.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              const Divider(height: 40),
              Text(
                "Documents",
                style: TextStyle(
                    color: colorss.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: size.height / 1.5,
                child: ListView.builder(
                  itemCount: applicationdata!.documentdata!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return viewDocument(
                        colorss, applicationdata!.documentdata![index]);
                  },
                ),
              ),
              // viewDocument(context),
              // viewDocument(context),
              // viewDocument(context),
              // viewDocument(context),
            ],
          ),
        ),
      ),
    );
  }
}
