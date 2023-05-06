import 'package:ezapplyadmin/uicode/pages/chat.dart';
import 'package:ezapplyadmin/uicode/pages/dashboard.dart';
import 'package:ezapplyadmin/uicode/pages/myposts.dart';
import 'package:ezapplyadmin/uicode/pages/newpost.dart';
import 'package:flutter/material.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  double navRadius = 15;

  int currentIndex = 0;

  final pages = [
    const Dashboard(),
    const MyPosts(),
    const Chatbox(),
    // NavChat(),
  ];
  // String barTitle = "Ezapply";

  List<String> bartitle = [
    "Dashboard",
    "My Posts",
    // "New Post",
    "Chats",
    // "Chat",
  ];
  List<BottomNavigationBarItem> navbaritems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home_filled), label: "Dashboard"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.newspaper_rounded), label: "My Post"),
    // BottomNavigationBarItem(
    //     icon: Icon(
    //       Icons.post_add_outlined,
    //     ),
    //     label: "New Post"),
    const BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: "Chat"),
  ];
  @override
  Widget build(BuildContext context) {
    final colorss = Theme.of(context).colorScheme;

    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        toolbarHeight: 50,
        titleSpacing: 1,
        titleTextStyle: TextStyle(
            fontSize: 18, color: colorss.primary, fontWeight: FontWeight.bold),
        // shape: Border(
        //   bottom: BorderSide(
        //       color: currentIndex != 1 | 3
        //           ? Colors.transparent
        //           : Colors.grey.shade300),
        // ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        foregroundColor: colorss.primary,
        title: Text(bartitle[currentIndex]),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(navRadius),
            topRight: Radius.circular(navRadius)),
        child: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            currentIndex: currentIndex,
            iconSize: 20,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Theme.of(context).colorScheme.primary,
            selectedItemColor: Theme.of(context).colorScheme.onPrimary,
            unselectedItemColor: Colors.grey[600],
            type: BottomNavigationBarType.fixed,
            items: navbaritems),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewPost(),
                ));
          },
          child: Icon(Icons.post_add)),
    );
  }
}
