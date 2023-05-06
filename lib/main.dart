import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezapplyadmin/code/apptheme/apptheme.dart';
import 'package:ezapplyadmin/code/managers/chat_manager.dart';
import 'package:ezapplyadmin/code/managers/forms_manager.dart';
import 'package:ezapplyadmin/code/managers/newsManager.dart';
import 'package:ezapplyadmin/code/managers/services_manager.dart';
import 'package:ezapplyadmin/uicode/pages/navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NewsManager>(create: (context) => NewsManager()),
        ChangeNotifierProvider<ChatManager>(create: (context) => ChatManager()),
        ChangeNotifierProvider<FormsManager>(
            create: (context) => FormsManager()),
        ChangeNotifierProvider<ServicesManager>(
            create: (context) => ServicesManager()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        theme: AppTheme.lightTheme,
        home: const MyNavBar(),
      ),
    );
  }
}
