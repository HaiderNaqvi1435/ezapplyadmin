import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../code/managers/newsManager.dart';

Widget largeButton({
  required String text,
  required ColorScheme colorss,
  VoidCallback? onpress,
}) {
  return SizedBox(
    height: 40,
    width: double.maxFinite,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: colorss.secondary,
        ),
        onPressed: onpress,
        child: Text(text)),
  );
}

Widget sqrButton(
    {required ColorScheme colorss,
    required String text,
    VoidCallback? ontap,
    required String asset}) {
  return InkWell(
    onTap: ontap,
    child: Card(
      elevation: 5,
      color: colorss.primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: Image.asset(
                asset,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: colorss.onPrimary),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget newsButton(ColorScheme colorss, String text, {VoidCallback? ontap}) {
  return SizedBox(
    height: 25,
    width: 75,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorss.secondary,
          textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          padding: EdgeInsets.zero,
          // fixedSize: Size(80, 20)),
        ),
        onPressed: ontap,
        child: Text(text)),
  );
}

Widget bannerButton(BuildContext context) {
  final colorss = Theme.of(context).colorScheme;
  final size = MediaQuery.of(context).size;
  final onpress = Provider.of<NewsManager>(context).pickbanner;
  var banner = Provider.of<NewsManager>(context).banner;

  return InkWell(
    onTap: onpress,
    child: Container(
        width: size.width / 1.3,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colorss.primary,
          borderRadius: BorderRadius.circular(6),
        ),
        child: banner != null
            ? Image.file(
                banner,
                fit: BoxFit.cover,
              )
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.photo_camera_rounded,
                      color: colorss.secondary,
                      size: 50,
                    ),
                    Text(
                      "Upload Banner",
                      style: TextStyle(
                          color: colorss.secondary,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
  );
}
