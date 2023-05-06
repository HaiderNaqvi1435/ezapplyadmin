// import 'package:ezapply/code/managers/auth_manager.dart';
// import 'package:ezapply/code/models/mapable/user_data.dart';
// import 'package:ezapply/uicode/widgets/logo.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AppDrawer extends StatelessWidget {
//   const AppDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final colorss = Theme.of(context).colorScheme;
//     return Drawer(
//       backgroundColor: colorss.primary,
//       child: ListView(
//         children: [
//           Consumer<AuthManager>(
//             builder: (context, value, child) => Column(
//               children: [
//                 const SizedBox(height: 20),
//                 SizedBox(height: 100, width: 100, child: applogo()),
//                 const SizedBox(height: 10),
//                 Text(
//                   value.userdata.username ?? "",
//                   style: TextStyle(
//                       fontSize: 18,
//                       color: colorss.onPrimary,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   value.userdata.useremail ?? "",
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: colorss.onPrimary,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Divider(
//             color: Colors.grey[200],
//             height: 40,
//           ),
//           Consumer<AuthManager>(
//             builder: (context, value, child) => ListTile(
//               onTap: value.userSignout,
//               iconColor: colorss.secondary,
//               textColor: colorss.secondary,
//               leading: const Icon(Icons.logout),
//               title: const Text("Logout"),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
