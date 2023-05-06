import 'package:flutter/material.dart';

Widget Inputtext(
    {String? hinttext,
    String? labeltext,
    void Function(String)? onChanged,
    TextEditingController? controller}) {
  return SizedBox(
    height: 40,
    child: TextFormField(
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        labelText: labeltext,
        hintText: hinttext,
      ),
    ),
  );
}
Widget searchinput(
    {String? hinttext, String? labeltext, required ColorScheme colorss}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    child: TextFormField(
      decoration: InputDecoration(
          hintText: "Search",
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.filter_alt_outlined,
              color: colorss.primary,
            ),
          ),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 26, vertical: 12),
          filled: true,
          fillColor: colorss.onPrimary,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50))
          // enabledBorder: OutlineInputBorder(
          //     borderSide: BorderSide(color: Colors.transparent),
          //     borderRadius: BorderRadius.circular(50)),
          // focusedBorder: OutlineInputBorder(
          //     borderSide: BorderSide(color: Colors.transparent),
          //     borderRadius: BorderRadius.circular(50)),
          // disabledBorder: OutlineInputBorder(
          //     borderSide: BorderSide(color: Colors.transparent),
          //     borderRadius: BorderRadius.circular(50)),
          // errorBorder: OutlineInputBorder(
          //     borderSide: BorderSide(color: Colors.transparent),
          //     borderRadius: BorderRadius.circular(50)),
          ),
    ),
  );
}
