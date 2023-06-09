import 'package:ezapplyadmin/code/models/mapable/user_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../code/managers/chat_manager.dart';
import '../../code/models/mapable/messege_data.dart';

Widget messageBubble(
    MESSAGEDATA message, BuildContext context, ColorScheme colorss) {
  return Align(
    alignment:
        message.isSentbyme ? Alignment.centerLeft : Alignment.centerRight,
    child: Card(
      color: message.isSentbyme ? colorss.primary : colorss.secondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          message.msg,
          style: TextStyle(
              color:
                  message.isSentbyme ? colorss.onPrimary : colorss.onSecondary),
        ),
      ),
    ),
  );
}

Widget messageHeader(MESSAGEDATA message, BuildContext context) {
  final colorss = Theme.of(context).colorScheme;

  return SizedBox(
    height: 40,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          DateFormat.yMMMd().format(message.dateTime.toDate()),
          style: TextStyle(color: colorss.primary),
        ),
      ),
    ),
  );
}

Widget newMessage(
    BuildContext context, ColorScheme colorss, Size size, String email) {
  return SizedBox(
    height: 40,
    width: size.width / 1.1,
    child: Consumer<ChatManager>(
      builder: (context, value, child) => TextFormField(
        controller: value.controller,
        decoration: InputDecoration(
          suffixIconColor: colorss.primary,
          suffixIcon: IconButton(
              onPressed: (() {
                value.sendMessage(email);
              }),
              icon: Icon(Icons.send_rounded)),
          filled: true,
          isDense: true,
          hintText: "Enter Message",
          contentPadding: EdgeInsets.all(10),
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(50),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(50),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    ),
  );
}

Widget userschat(ColorScheme colorss, USERDATA userdata) {
  return Consumer<ChatManager>(
    builder: (context, value, child) => ListTile(
      onTap: () async {
        value.getMessages(userdata.useremail!);
      },
      // onTap: value.getMessages(userdata.useremail!),
      // tileColor: Color.fromARGB(39, 33, 149, 243),
      title: Text(
        userdata.username!,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Text(
        userdata.useremail!,
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      ),
      leading: const CircleAvatar(),
    ),
  );
}
