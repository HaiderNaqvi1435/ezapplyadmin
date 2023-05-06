import 'package:ezapplyadmin/code/managers/chat_manager.dart';
import 'package:ezapplyadmin/uicode/widgets/messagewidgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Chatbox extends StatelessWidget {
  const Chatbox({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final colorss = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ElevatedButton(onPressed: (){}, child: child)
              SizedBox(
                height: size.height,
                child: Consumer<ChatManager>(
                  builder: (context, value, child) => ListView.builder(
                    itemCount: value.userslist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return userschat(colorss, value.userslist[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
