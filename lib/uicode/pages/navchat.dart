import 'package:ezapplyadmin/code/managers/chat_manager.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

import '../../code/models/mapable/messege_data.dart';
import '../widgets/messagewidgets.dart';

class NavChat extends StatelessWidget {
  NavChat({required this.email, super.key});
  String email;
  @override
  Widget build(BuildContext context) {
    final colorss = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: colorss.primary,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Consumer<ChatManager>(
              builder: (context, manager, child) => Expanded(
                  child: GroupedListView<MESSAGEDATA, DateTime>(
                      reverse: true,
                      order: GroupedListOrder.DESC,
                      useStickyGroupSeparators: true,
                      floatingHeader: true,
                      elements: manager.messageList,
                      groupBy: ((message) {
                        DateTime dateTime = message.dateTime.toDate();
                        return DateTime(
                            dateTime.day, dateTime.month, dateTime.year);
                      }),
                      groupHeaderBuilder: (MESSAGEDATA message) =>
                          messageHeader(message, context),
                      itemBuilder: (context, MESSAGEDATA message) =>
                          messageBubble(message, context, colorss))),
            ),
            const SizedBox(height: 10),
            newMessage(context, colorss, size, email),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
